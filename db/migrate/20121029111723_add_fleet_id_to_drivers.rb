class AddFleetIdToDrivers < ActiveRecord::Migration
  def change
    add_column :drivers, :fleet_id, :integer
  end
end
