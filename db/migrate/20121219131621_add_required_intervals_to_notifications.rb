class AddRequiredIntervalsToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :required_intervals, :boolean
  end
end
