class ChangeIdNumberToBeStringInPassengers < ActiveRecord::Migration[5.2]
  def change
    change_column :passengers, :id_number, :string
  end
end
