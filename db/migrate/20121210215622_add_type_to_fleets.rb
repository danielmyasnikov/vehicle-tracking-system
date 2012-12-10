class AddTypeToFleets < ActiveRecord::Migration
  def change
    add_column :fleets, :type, :string
  end
end
