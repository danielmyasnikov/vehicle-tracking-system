namespace :mtf do 
  desc "Count KM estimates for fleets" 
  task :count_daily_milage => :environment do |t, args|
    @start_time = Time.now
    log = Log.new(:name => 'milage_calculation')
    log.save!
    started = "Started calculation for fleets at #{@start_time.strftime("%Y/%m/%d - %H:%M:%S")}"
    log.start_timestamp = started
    Fleet.all.each do |f|
      aline = log.lines.create!
      @current_time = Time.now
      line = "Processing fleet #{f.id} actual = #{f.actual_km} \n"
      aline.line = line
      f.cron_calc_milage
      line = "Processing fleet #{f.id} calculated = #{f.actual_km}"
      aline.line << line
      aline.save!
    end
    @finish_time = Time.now
    finished = "Finished calculation for fleets at #{@finish_time.strftime("%Y/%m/%d - %H:%M:%S")}"
    log.final_timestamp = finished
    if log.save!
      log.status = true
      log.save!
    else
      log.status = false
      log.save!
    end
  end
  
  desc "due and overdue vehicles"
  task :dues_overdues => :environment do |t, args|
    due_serviceables = []
    doverdue_serviceablesue_serviceables = []
    TruckFleet.all.each do |tf|
      due_serivce_interval = tf.settings_due_service_interval 
      due_serviceables << Serviceable.due_in(due_serivce_interval)
      overdue_serivce_interval = tf.settings_overdue_service_interval
      overdue_serviceables << Serviceable.overdue_in(overdue_serivce_interval)
    end
    due_serviceables.each do |s|
      UserMailer.overdue_service(s) if !s.nil?
    end if due_serviceables
    overdue_serviceables.each do |s|
      UserMailer.due_service(s) if !s.nil?
    end
  end
  
  desc "date of booking reminder email notification"
  task :date_of_booking => :environment do |t, args|
    services = []
    TruckFleet.all.each do |tf|
      services << tf.services.where(:start_service_date => Date.today) if tf.services.present?
    end
    services.each do |s|
      UserMailer.date_of_booking(s) if !s.nil?
    end
  end
  
  desc "date before booking email notification"
  task :prebooking_reminder => :environment do |t, args|
    services = []
    TruckFleet.all.each do |tf|
      services << tf.services.where(:start_service_date => Date.today + 1) if tf.services.present?
    end
    services.each do |s|
      UserMailer.prebooking_reminder(s) if !s.nil?
    end
  end
  
  desc "service date reminder"
  task :date_of_service => :environment do |t, args|
    serviceable = Serviceable.due_in(0) # 0 means today :)
    serviceable.each do |s|
      UserMailer.date_of_service(s) if !s.nil?
    end
  end
end