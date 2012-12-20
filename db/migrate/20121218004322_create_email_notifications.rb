class CreateEmailNotifications < ActiveRecord::Migration
  def change
    create_table :email_notifications do |t|
      t.integer :setting_id
      t.integer :notification_id
      t.boolean :primary
      t.boolean :secondary
    end
  end
end
