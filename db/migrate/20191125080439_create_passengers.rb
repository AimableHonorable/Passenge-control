class CreatePassengers < ActiveRecord::Migration[5.2]
  def change
    create_table :passengers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :phone
      t.integer :id_nuber
      t.string :destination
      t.string :ref_first_name
      t.string :ref_last_name
      t.string :ref_phone_number
      t.date :entry_on
      t.date :return_on

      t.timestamps
    end
  end
end
