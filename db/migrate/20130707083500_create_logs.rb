class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :name
      t.string :line
      t.boolean :status

      t.timestamps
    end
  end
end
