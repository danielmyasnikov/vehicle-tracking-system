class AddIntervalToEmailNotifications < ActiveRecord::Migration
  def change
    add_column :email_notifications, :interval, :integer
  end
end
