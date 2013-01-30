class CreateFautlBooks < ActiveRecord::Migration
  def change
    create_table :fautl_books do |t|
      t.string :fault_type
      t.integer :driver_id
      t.integer :fleet_id
      t.date :fault_date
      t.string :mileage
      t.string :contact_no
      t.text :faults

      t.timestamps
    end
  end
end
