class UserMailer < ActionMailer::Base
  default :from => "info.mytruckfleet@gmail.com"
  
  def due_services(due_fleets, emails)
    @due_fleets = due_fleets
    emails = emails.join(",")
    mail :to => emails,
         :subject => "Vehicles due for service"
  end
  
  def registered_user(user)
    @user = user
    mail(
      :to => "#{user.name} <#{user.email}>", 
      :subject => "Registered",
    )
  end
  
  def update_service(user, service)
    vehicle = service.fleet
    notification = Notification.find_by_name("Updated / Rescheduled service")
    setting = vehicle.truck_fleet.setting.email_notifications.find_by_notification_id(notification.id)
    emails = self.find_emails(user, vehicle, setting)
    
    mail :to => "myasnikovdaniil@gmail.com",
         :subject => "Service for vehicle #{vehicle.name} has been updated"
  end
  
  def completed_booking(user, service)
    notification = Notification.find_by_name("Completed booking")
    vehicle = service.fleet
    setting = vehicle.truck_fleet.setting.email_notifications.find_by_notification_id(notification.id)
    emails = self.find_emails(user, vehicle, setting)
    
    mail :to => "myasnikovdaniil@gmail.com",
         :subject => "Booking completed. For vehicle #{vehicle.name}"
  end
  
  def postponed_service(user, service)
    notification = Notification.find_by_name("Postponed service")
    vehicle = service.fleet
    setting = vehicle.truck_fleet.setting.email_notifications.find_by_notification_id(notification.id)
    emails = self.find_emails(user, vehicle, setting)
    
    mail :to => "myasnikovdaniil@gmail.com",
         :subject => "Service Postponed. For vehicle #{vehicle.name}"
  end
  
  def cancel_service(user, vehicle, service_type_name, service_date = nil, next_service_date = nil)
    @user = user
    @vehicle = vehicle
    @service_type_name = service_type_name
    @service_date = service_date
    @next_service_date = next_service_date
    
    notification = Notification.find_by_name("Cancel service")
    setting = vehicle.truck_fleet.setting.email_notifications.find_by_notification_id(notification.id)
    emails = self.find_emails(user, vehicle, setting)
    
    mail :to => "myasnikovdaniil@gmail.com",
         :subject => "Service cancelled. For vehicle #{vehicle.name}"
  end
  
  def update_vehicle_info(user, vehicle)
    @user = user
    notification = Notification.find_by_name("Update vehicle info except milage")
    setting = vehicle.truck_fleet.setting.email_notifications.find_by_notification_id(notification.id)
    emails = self.find_emails(user, vehicle, setting)
    
    mail :to => "myasnikovdaniil@gmail.com",
         :subject => "Info updated. For #{vehicle.fleet_number}"
  end
  
  # service: Serviceable, you can use # => service.fleet or service.service_type.name
  def postpone_service(user, service)
    @user = user
    notification = Notification.find_by_name("Postponed service")
    vehicle = service.fleet
    setting = vehicle.truck_fleet.setting.email_notifications.find_by_notification_id(notification.id)
    emails = self.find_emails(user, vehicle, setting)
    
    mail :to => "myasnikovdaniil@gmail.com",
         :subject => "Service postponed! For #{vehicle.fleet_number}"
  end
  
  
  def service_done(user, service)
    @user = user
    notification = Notification.find_by_name("Service done")
    vehicle = service.fleet
    setting = vehicle.truck_fleet.setting.email_notifications.find_by_notification_id(notification.id)
    emails = self.find_emails(user, vehicle, setting)
    
    mail :to => "myasnikovdaniil@gmail.com",
         :subject => "Service accomplished. For #{vehicle.fleet_number}"
  end
  
  def find_emails(user, vehicle, setting)
    p 'Settings primary / secondary'
    p setting.primary
    p setting.secondary
    users = vehicle.truck_fleet.users
    if (setting.primary && setting.secondary)
      emails = users.pluck(:email)
    elsif (setting.primary && !setting.secondary)
      emails = users.where(:role => "Primary").pluck(:email)
    elsif (!setting.primary && setting.secondary)
      emails = users.where(:role => "Secondary").pluck(:email)
    elsif
      emails = user.email
    end
    
    emails.kind_of?(Array)? emails.join(",") : emails
  end
end
