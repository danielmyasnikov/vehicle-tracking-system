set :output, "/home/dan/www/mytruckfleet/log/cron_log.log"
every :day, :at => '5:30am' do
  command 'cd /home/dan/www/mytruckfleet/ && bundle exec rake mtf:count_daily_milage RAILS_ENV=production'
end
