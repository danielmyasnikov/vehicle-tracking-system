class AddTruckFleetIdToServiceTypes < ActiveRecord::Migration
  def change
    add_column :service_types, :truck_fleet_id, :integer
  end
end
