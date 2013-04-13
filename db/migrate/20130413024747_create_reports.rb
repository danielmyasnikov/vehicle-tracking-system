class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :fleet
      t.references :service
      t.float :warranty
      t.float :repair
      t.float :damage
      t.float :breakdown
      t.float :service

      t.timestamps
    end
    add_index :reports, :fleet_id
    add_index :reports, :service_id
  end
end
