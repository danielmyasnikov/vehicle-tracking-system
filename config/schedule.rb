set :output, "/home/dan/www/mytruckfleet/log/cron_log.log"
every :day, :at => '5:30am' do
  command 'cd /home/dan/www/mytruckfleet/ && bundle exec rake mtf:count_daily_milage RAILS_ENV=production'
end

every :day, :at => '6:00am' do
  command 'cd /home/dan/www/mytruckfleet/ && bundle exec rake mtf:dues_overdues RAILS_ENV=production'
end

every :day, :at => '6:30am' do
  command 'cd /home/dan/www/mytruckfleet/ && bundle exec rake mtf:date_of_booking RAILS_ENV=production'
end

every :day, :at => '7:00am' do
  command 'cd /home/dan/www/mytruckfleet/ && bundle exec rake mtf:prebooking_reminder RAILS_ENV=production'
end

every :day, :at => '7:30am' do
  command 'cd /home/dan/www/mytruckfleet/ && bundle exec rake mtf:date_of_service RAILS_ENV=production'
end