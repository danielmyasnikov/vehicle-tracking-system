namespace :mtf do 
  desc "Count KM estimates for fleets" 
  task :count_daily_milage => :environment do |t, args|
    @start_time = Time.now
    log = Log.new(:name => 'milage_calculation')
    log.save!
    started = "Started calculation for fleets at #{@start_time.strftime("%Y/%m/%d - %H:%M:%S")}"
    log.start_timestamp = started
    p started
    Fleet.all.each do |f|
      aline = log.lines.create!
      @current_time = Time.now
      line = "Processing fleet #{f.id} actual = #{f.actual_km} \n"
      p line
      aline.line = line
      f.cron_calc_milage
      line = "Processing fleet #{f.id} calculated = #{f.actual_km}"
      p line
      aline.line << line
      aline.save!
    end
    @finish_time = Time.now
    finished = "Finished calculation for fleets at #{@finish_time.strftime("%Y/%m/%d - %H:%M:%S")}"
    log.final_timestamp = finished
    p finished
    if log.save!
      p 'the log was saved'
      log.status = true
      log.save!
    else
      p 'the error occured with the log save'
      log.status = false
      log.save!
    end
  end
end