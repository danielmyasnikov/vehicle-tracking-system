set :output, "/log/cron_log.log"
every 1.minutes do
  command 'bundle exec rake mtf:count_daily_milage RAILS_ENV=production'
end
