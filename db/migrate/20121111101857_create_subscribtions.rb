class CreateSubscribtions < ActiveRecord::Migration
  def change
    create_table :subscribtions do |t|
      t.string :name

      t.timestamps
    end
  end
end
