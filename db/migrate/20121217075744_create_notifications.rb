class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :name
      t.boolean :primary
      t.boolean :secondary

      t.timestamps
    end
  end
end
