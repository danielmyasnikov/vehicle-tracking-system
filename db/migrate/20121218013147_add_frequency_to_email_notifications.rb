class AddFrequencyToEmailNotifications < ActiveRecord::Migration
  def change
    add_column :email_notifications, :frequency, :integer
  end
end
