class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :truck_identification
      t.string :email_periods
      t.integer :email_recepient_id

      t.timestamps
    end
  end
end
