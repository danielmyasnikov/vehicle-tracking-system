ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :user_name            => "info.mytruckfleet@gmail.com",
  :domain               => "gmail.com",
  :password             => "rus9uGap",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
# require 'development_mail_interceptor'
# ActionMailer::Base.default_url_options[:host] = "localhost:3000"
# ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?