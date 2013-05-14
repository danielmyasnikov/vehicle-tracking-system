class AddColumnsToTruckFleet < ActiveRecord::Migration
  def change
    add_column :truck_fleets, :web_site, :string
    add_column :truck_fleets, :business_phone, :string
    add_column :truck_fleets, :fax, :string
    add_column :truck_fleets, :landline, :string
  end
end
