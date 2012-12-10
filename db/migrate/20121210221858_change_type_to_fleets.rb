class ChangeTypeToFleets < ActiveRecord::Migration
  def up
    rename_column :fleets, :type, :vehicle_type
  end

  def down
    rename_column :fleets, :vehicle_type, :type
  end
end
