class AddStatusToPassenger < ActiveRecord::Migration[5.2]
  def change
    add_column :passengers, :status, :boolean, default: false
  end
end
