class PassengersController < ApplicationController
  before_action :set_passenger, only: [:show, :edit, :update]
   before_action :authenticate_user!
  def index
    @search = Passenger.ransack(params[:q])
    if params[:q]
      @passengers = @search.result.page params[:page]
    else
      @passengers = Passenger.all.order('created_at desc').page params[:page]
    end

  end
  def new
    @passenger = Passenger.new
  end
  def create
    @passenger = current_user.passengers.build(passenger_params)
    if @passenger.save
      redirect_to passengers_path, notice: 'new passenger registered'
    else
      render:new
    end
  end
  def edit

  end
  def update
    if @passenger.update
      redirect_to passengers_path, notice: 'passenger information updated!'
    end
  end

  private
  def set_passenger
    @passenger = Passenger.find(params[:id])
  end

  def passenger_params
    params.require(:passenger).permit(:first_name, :last_name, :email, :phone, :id_number, :destination, :ref_first_name, :ref_last_name, :ref_phone_number, :entry_on, :return_on)
  end
end
