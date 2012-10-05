class AddTruckFleetIdToFleets < ActiveRecord::Migration
  def change
    add_column :fleets, :truck_fleet_id, :integer
  end
end
