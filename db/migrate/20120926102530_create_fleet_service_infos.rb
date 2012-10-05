class CreateFleetServiceInfos < ActiveRecord::Migration
  def change
    create_table :fleet_service_infos do |t|
      t.integer :fleet_id
      t.integer :service_id
      t.float :km_since_last_service
      t.float :time_since_last_service

      t.timestamps
    end
  end
end
