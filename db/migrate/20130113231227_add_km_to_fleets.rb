class AddKmToFleets < ActiveRecord::Migration
  def change
    add_column :fleets, :km, :float
  end
end
