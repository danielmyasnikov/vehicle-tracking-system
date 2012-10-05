class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.integer :fleet_id
      t.integer :repairer_id
      t.string :service_type
      t.string :warranty
      t.text :damage
      t.string :repair
      t.boolean :self_service
      t.float :KM_since_last_service
      t.float :time_since_last_service

      t.timestamps
    end
  end
end
