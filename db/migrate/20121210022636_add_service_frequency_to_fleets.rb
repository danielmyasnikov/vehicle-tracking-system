class AddServiceFrequencyToFleets < ActiveRecord::Migration
  def change
    add_column :fleets, :service_frequency_period, :string
    add_column :fleets, :service_frequency_number, :string
  end
end
