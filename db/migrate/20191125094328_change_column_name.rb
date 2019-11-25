class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :passengers, :id_nuber, :id_number
  end
end
