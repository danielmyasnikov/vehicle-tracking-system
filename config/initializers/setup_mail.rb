ActionMailer::Base.smtp_settings = {
#  :address              => "smtp.kmail.sxtrailers.com.au ",
#  :domain               => "kmail.sxtrailers.com.au",
#  :port                 => "25",
  :address              => "smtp.gmail.com",
  :user_name            => "info.mytruckfleet@gmail.com",
  :domain               => "gmail.com",
  :port                 => "25",
  :password             => "cxylioxthnylthrt",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
