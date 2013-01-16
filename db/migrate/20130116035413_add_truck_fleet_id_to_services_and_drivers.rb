class AddTruckFleetIdToServicesAndDrivers < ActiveRecord::Migration
  def change
    add_column :services, :truck_fleet_id, :integer
    add_column :drivers, :truck_fleet_id, :integer
  end
end
