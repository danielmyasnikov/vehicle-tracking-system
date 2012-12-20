class AddPirmaryKeyIdToEmailNotifications < ActiveRecord::Migration
  def change
    add_column :email_notifications, :id, :primary_key unless EmailNotification.column_names.include?('id')
  end
end
