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
  
  def scheduled_service_email(user, service)
    
  end
  
  def scheduled_training_email(user, training)
    
  end
end
