class UserMailer < ActionMailer::Base
  default from: "info.niftysoft@gmail.com"
  
  def registered_user(user)
    @user = user
    @subscribtions = user.find_subscribtions
    mail(
      :to => "#{user.name} <#{user.email}>", 
      :subject => "Registered",
    )
  end
  
  def service(service)
    @greeting = ''
    mail :to => "myasnikovdaniil@gmail.com"
  end
  
  def scheduled_service_email(user, service)
    
  end
  
  def scheduled_training_email(user, training)
    
  end
end
