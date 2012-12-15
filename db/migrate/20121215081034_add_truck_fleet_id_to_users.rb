class AddTruckFleetIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :truck_fleet_id, :integer
    remove_column :truck_fleets, :user_id
  end
end
