class ChangeViNinFleets < ActiveRecord::Migration
  def up
    rename_column :fleets, :VIN, :vin
  end

  def down
    rename_column :fleets, :vin, :VIN
  end
end
