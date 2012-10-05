class CreateContactTruckFleets < ActiveRecord::Migration
  def change
    create_table :contact_truck_fleets do |t|
      t.boolean :main
      t.string :title
      t.string :mobile
      t.string :email
      t.integer :truck_fleet_id

      t.timestamps
    end
  end
end
