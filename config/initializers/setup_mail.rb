ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :user_name            => "info.mytruckfleet@gmail.com",
  :domain               => "gmail.com",
  :port                 => "587",
  :password             => "rus9uGap",
  :authentication       => "plain",
  :enable_starttls_auto => true
}