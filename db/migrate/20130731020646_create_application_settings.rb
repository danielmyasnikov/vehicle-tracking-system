class CreateApplicationSettings < ActiveRecord::Migration
  def change
    create_table :application_settings do |t|
      t.string :name
      t.integer :value
      t.boolean :trigger

      t.timestamps
    end
  end
end
