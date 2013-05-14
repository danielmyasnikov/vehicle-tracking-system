class AddFullNameToContactTruckFleets < ActiveRecord::Migration
  def change
    add_column :contact_truck_fleets, :full_name, :string
  end
end
