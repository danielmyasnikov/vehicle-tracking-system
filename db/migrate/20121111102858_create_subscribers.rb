class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.integer :subscribtion_id
      t.integer :user_id
      t.boolean :stop_this_email
      t.boolean :unsubscribe

      t.timestamps
    end
  end
end
