class CreateRepairers < ActiveRecord::Migration
  def change
    create_table :repairers do |t|
      t.string :business_name
      t.string :picture
      t.string :street_address_1
      t.string :street_address_2
      t.string :suburb
      t.string :state
      t.integer :postcode
      t.boolean :hour_service_24
      t.string :phone_number

      t.timestamps
    end
  end
end
