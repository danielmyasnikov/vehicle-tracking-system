class AddUserIdToTruckFleets < ActiveRecord::Migration
  def change
    add_column :truck_fleets, :user_id, :integer
  end
end
