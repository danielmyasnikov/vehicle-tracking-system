class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :phone_no
      t.string :pic
      t.string :dl_number
      t.date :dl_expiry
      t.string :training_schedule
      t.string :training_documents

      t.timestamps
    end
  end
end
