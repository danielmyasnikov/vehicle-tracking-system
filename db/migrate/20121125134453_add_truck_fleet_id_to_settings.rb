class AddTruckFleetIdToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :truck_fleet_id, :integer
  end
end
