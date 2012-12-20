class AddColumnsToSettings < ActiveRecord::Migration
  # TODO: optimize the database => create many to many relationship for settings -> notifications
  def change
    add_column :settings, :update_vehicle_info , :string
    add_column :settings, :cancel_service , :string
    add_column :settings, :postponed_service , :string
    add_column :settings, :due_service , :string
    add_column :settings, :overdue_service , :string
    add_column :settings, :overdue_service_reminder_interval, :integer
    add_column :settings, :completed_booking , :string
    add_column :settings, :booking_date_reminder , :string
    add_column :settings, :pre_booking_date_reminder , :string
    add_column :settings, :pre_booking_date_reminder_interval, :integer
    add_column :settings, :service_date, :string
    add_column :settings, :overdue_service_information_incomplete, :string
    add_column :settings, :service_done , :string
    add_column :settings, :updated_rescheduled_service , :string
  end
end
