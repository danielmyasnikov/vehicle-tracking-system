class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.integer :item
      t.string :item_type
      t.text :line
      t.references :log

      t.timestamps
    end
    add_index :lines, :log_id
  end
end
