class ChangePhoneToBeStringInPassengers < ActiveRecord::Migration[5.2]
  def change
    change_column :passengers, :phone, :string
  end
end
