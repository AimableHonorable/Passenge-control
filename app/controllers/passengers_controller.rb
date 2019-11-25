class PassengersController < ApplicationController
   before_action :authenticate_user!
  def index
    @passengers = Passenger.all
  end
  def new
    @passenger = Passenger.new
  end
  def create
    @passenger = Passenger.new(passenger_params)
    if @passenger.save
      redirect_to passengers_path, notice: 'new passenger registered'
    else
      render:new
    end
  end

  private

  def passenger_params
    params.require(:passenger).permit(:first_name, :last_name, :email, :phone, :id_number, :destination, :ref_first_name, :ref_last_name, :ref_phone_number, :entry_on, :return_on)
  end
end
