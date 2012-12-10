class AddMapsToRepairers < ActiveRecord::Migration
  def change
    add_column :repairers, :latitude,  :float #you can change the name, see wiki
    add_column :repairers, :longitude, :float #you can change the name, see wiki
    add_column :repairers, :gmaps, :boolean #not mandatory, see wiki
  end
end
