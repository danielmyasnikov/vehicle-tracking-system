class UserMailer < ActionMailer::Base
  default :from => "info.mytruckfleet@gmail.com"
  
  def registered_user(user)
    @user = user
    mail(
      :to => "#{user.name} <#{user.email}>", 
      :subject => "Registered",
    )
  end
  
  def service(service, emails)
    @fleet = Fleet.find(service.fleet_id)
    @repairer = Repairer.find(service.repairer_id)
    @service = service
    
    emails = emails.join(",")
    mail :to => emails, 
         :subject => "Service has been successfully booked"
  end
  
  def update_vehicle_info(user, vehicle)
    @user = user
    en = user.truck_fleet.setting.email_notifications.where(:notification_id => 4).first
    emails = []
    user.truck_fleet.contact_truck_fleets.each do |p|
      emails << p.email if p.email.present? && p.main == true && en.primary == true
      emails << p.email if p.email.present? && p.main == false && en.secondary == true
    end
    emails = emails.join(",") if !emails.nil?
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
