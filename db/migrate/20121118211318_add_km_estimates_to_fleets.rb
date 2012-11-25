class AddKmEstimatesToFleets < ActiveRecord::Migration
  def change
    add_column :fleets, :km_estimates, :float
    add_column :fleets, :period, :string
  end
end
