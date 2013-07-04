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
    notification = Notification.find_by_name("Updated / Rescheduled service")
    vehicle = service.fleet
    emails = vehicle.truck_fleet.collect_emails_for_notification(notification)
    emails = emails.join(",") if !emails.nil?
    mail :to => emails,
         :subject => "Service for vehicle #{vehicle.name} has been updated"
  end
  
  def completed_booking(user, service)
    notification = Notification.find_by_name("Completed booking")
    vehicle = service.fleet
    emails = vehicle.truck_fleet.collect_emails_for_notification(notification)
    emails = emails.join(",") if !emails.nil?
    mail :to => emails,
         :subject => "Service for vehicle #{vehicle.name} has been booked"
  end
  
  def postponed_service(vehicle)
    notification = Notification.find_by_name("Postponed service")
    emails = vehicle.truck_fleet.collect_emails_for_notification(notification)
    emails = emails.join(",") if !emails.nil?
    mail :to => emails,
         :subject => "Service for vehicle #{vehicle.name} has been POSTPONED"
  end
  
  def service(service, emails)
    @fleet = Fleet.find(service.fleet_id)
    @repairer = Repairer.find(service.repairer_id)
    @service = service
    
    emails = emails.join(",")
    mail :to => emails, 
         :subject => "Service has been successfully booked"
  end
  
  def cancel_service(user, vehicle, service_type_name, service_date, next_service_date)
    @user = user
    @vehicle = vehicle
    @service_type_name = service_type_name
    @service_date = service_date
    @next_service_date = next_service_date
    
    notification = Notification.find_by_name("Cancel service")
    emails = user.truck_fleet.collect_emails_for_notification(notification)
    emails << user.email
    emails = emails.join(",") if !emails.nil?
    mail :to => emails,
         :subject => "Service for vehicle #{vehicle.name} has been removed"
  end
  
  def update_vehicle_info(user, vehicle)
    @user = user
    notification = Notification.find_by_name("Update vehicle info except milage")
    emails = vehicle.truck_fleet.collect_emails_for_notification(notification)
    emails ||= user.email
    p "emails!!!"
    p emails
    
    emails = emails.join(",") if emails.kind_of?(Array)
    mail :to => emails,
         :subject => "Vehicle information has been updated for #{vehicle.fleet_number}"
  end
  
  def postpone_service(user, service)
    
  end
  
  def book_service(user, service)
    
  end
  
  def service_done(user, service)
    
  end
end
