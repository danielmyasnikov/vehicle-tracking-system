class CreateTruckFleets < ActiveRecord::Migration
  def change
    create_table :truck_fleets do |t|
      t.string :trading_name_of_business
      t.string :street
      t.string :street_2
      t.string :suburb
      t.string :state
      t.integer :postcode

      t.timestamps
    end
  end
end
