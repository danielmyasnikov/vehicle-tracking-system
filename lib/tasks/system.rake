namespace :mtf do 
  desc "Count KM estimates for fleets" 
  task :count_daily_milage => :environment do |t, args|
    @start_time = Time.now
    puts "Started calculation for fleets at #{@start_time.strftime("%Y/%m/%d - %H:%M:%S")}"
    Fleet.all.each do |f|
      @current_time = Time.now
      puts "Processing fleet #{f.id} actual = #{f.actual_km}"
      f.cron_calc_milage
      puts "Processing fleet #{f.id} calculated = #{f.actual_km}"
    end
    @finish_time = Time.now
    puts "Finished calculation for fleets at #{@finish_time.strftime("%Y/%m/%d - %H:%M:%S")}"
  end
end