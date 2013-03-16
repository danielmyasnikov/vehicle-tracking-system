set :output, "/path/to/my/cron_log.log"
every 24.hours do
  rake "mtf:calc_milage"
end
