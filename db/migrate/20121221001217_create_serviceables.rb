class CreateServiceables < ActiveRecord::Migration
  def change
    create_table :serviceables do |t|
      t.integer :service_type_id
      t.integer :fleet_id
      t.float :service_km_interval
      t.float :service_time_interval
      t.string :service_period

      t.timestamps
    end
  end
end
