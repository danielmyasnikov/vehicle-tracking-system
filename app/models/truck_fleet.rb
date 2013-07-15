class TruckFleet < ActiveRecord::Base
  attr_accessible :postcode, :state, :street, :street_2, :suburb, 
                  :trading_name_of_business, :contact_truck_fleets_attributes,
                  :avatar, :full_name, :avatar_file_name, :avatar_content_type, 
                  :avatar_file_size, :avatar_updated_at, :web_site, :business_phone, 
                  :fax, :landline
                  
  has_many :contact_truck_fleets, :dependent => :destroy
  has_many :fleets
  has_many :fault_book
  has_many :drivers
  has_many :repairers
  has_many :services
  has_attached_file :avatar, :styles => {:medium => "300x300", :thumb => "40x40"}
  accepts_nested_attributes_for :contact_truck_fleets, :reject_if => lambda { |a| a[:email].blank? }, :allow_destroy => true
  has_one :setting
  has_many :users
  has_many :reports, :through => :fleets
  
  def name
    trading_name_of_business
  end
  
  def settings_due_service_interval
    notification = setting.email_notifications.where(:notification_id => Notification.find_by_name("Due service").id)
    notification.first.interval
  end
  
  def settings_overdue_service_interval
    notification = setting.email_notifications.where(:notification_id => Notification.find_by_name("Overdue service").id)
    notification.first.interval
  end
   
  def collect_emails_for_notification(notification)
    emails = []
    if send_to_primaries?(notification) && send_to_secondaries?(notification)
      emails       << find_primary_contacts
      emails       << find_secondary_contacts
    elsif send_to_primaries?(notification) && !send_to_secondaries?(notification)
      emails       << find_primary_contacts
    elsif send_to_secondaries?(notification) && !send_to_primaries?(notification)
      emails       << find_secondary_contacts
    end
    emails.flatten if emails.present?
  end
  
  def send_to_primaries?(notification)
    # TODO: work on it!!! There was a nil class for primary
    setting.email_notifications.where(:notification_id => notification.id).first.primary if setting.email_notifications.where(:notification_id => notification.id).first.present? 
  end
  
  def send_to_secondaries?(notification)
    # TODO: work on it!!! There was a nil class for secondary
    setting.email_notifications.where(:notification_id => notification.id).first.secondary if setting.email_notifications.where(:notification_id => notification.id).first.present?
  end
  
  def find_primary_contacts
    contact_truck_fleets.where(:main => true).pluck(:email) if contact_truck_fleets.present?
  end
  
  def find_secondary_contacts
    contact_truck_fleets.where(:main => false).pluck(:email) if contact_truck_fleets.present?
  end
  
  def self.find_contacts_by_fleet_id(fleet_id)
    fleet = Fleet.find(fleet_id)
    fleet.truck_fleet.contact_truck_fleets.pluck(:email)
  end
  
  def self.scoped_by_vehicle
    @truck_fleets = {}
    scoped.each do |tf|
      @truck_fleets.merge!({tf => tf.fleets.order("fleet_number ASC")})
    end
    return @truck_fleets
  end 
end