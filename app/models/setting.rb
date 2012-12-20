class Setting < ActiveRecord::Base
  # TODO: refactor this bullshit
  attr_accessible :email_periods, :email_recepient_id, :truck_identification, 
                  :truck_fleet_id, :sort, :update_vehicle_info, :cancel_service, 
                  :postponed_service, :due_service, :overdue_service, :completed_booking, 
                  :booking_date_reminder, :pre_booking_date_reminder, :service_date, 
                  :overdue_service_information_incomplete, :service_done, :updated_rescheduled_service
                  
  belongs_to :truck_fleet
  has_many :notifications, :through => :email_notifications
  has_many :email_notifications
  validates_uniqueness_of :truck_fleet_id 
  # validates :email, :email_format => true
end
