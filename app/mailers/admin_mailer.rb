class AdminMailer < ActionMailer::Base
  default from: "myasnikovdaniil@gmail.com"
  
  def new_user_waiting_for_approval(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Registered")
  end
end
