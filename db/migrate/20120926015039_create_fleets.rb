class CreateFleets < ActiveRecord::Migration
  def change
    create_table :fleets do |t|
      t.string :pic
      t.string :make
      t.string :model
      t.integer :year
      t.string :VIN
      t.string :registration
      t.string :fleet_number
      t.boolean :auto_services

      t.timestamps
    end
  end
end
