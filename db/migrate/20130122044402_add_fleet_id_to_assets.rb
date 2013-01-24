class AddFleetIdToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :fleet_id, :integer
  end
end
