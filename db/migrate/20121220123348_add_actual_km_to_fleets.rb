class AddActualKmToFleets < ActiveRecord::Migration
  def change
    add_column :fleets, :actual_km, :float
  end
end
