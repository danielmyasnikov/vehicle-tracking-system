class AddPirmaryKeyIdToEmailNotifications < ActiveRecord::Migration
  def change
    add_column :email_notifications, :id, :primary_key
  end
end
