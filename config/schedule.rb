set :output, "#{RAILS_ROOT}/log/cron_log.log"
every 1.minutes do
  rake "mtf:count_daily_milage"
end
