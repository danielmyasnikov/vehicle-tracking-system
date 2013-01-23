# Checks vehicles that are due and shoots an email with the data 
namespace :mtf do
  desc 'Sends emails for vehicles that are due for the service'
  task :send_due_vehicles => :environment do
    @truck_fleets = TruckFleet.all
    
    @truck_fleets.each do |tf|
      due_fleets = []
      overdue_fleets = []
      due_today = []
      tf.fleets.each do |f|
        f.serviceables.each do |s|
          if s.due?
            due_fleets << { :fleet_name => f.name, :next_service_date => s.next_service_date, :service_name => s.service_type.name }
            # puts "Fleet #{f.name} is due for service #{s.service_type.name}"
          elsif s.today?
            due_today << { :fleet_name => f.name, :next_service_date => s.next_service_date, :service_name => s.service_type.name }
            # puts "Fleet #{f.name} is due TODAY for service #{s.service_type.name}"
          elsif s.overdue?
            overdue_fleets << { :fleet_name => f.name, :next_service_date => s.next_service_date, :service_name => s.service_type.name }
            puts "Fleet #{f.name} is OVERDUE for service #{s.service_type.name} next service date: #{s.next_service_date}"
          else
            # puts "Fleet #{f.name} is not due for any service"
          end
        end
      end
      if due_fleets.present?
        notification  = Notification.find_by_name("Due service")
        emails        = tf.collect_emails_for_notification(notification)
        if emails.present? 
          puts "Shooting #{due_fleets.count} emails"
          UserMailer.due_services(due_fleets, emails).deliver
          puts "Successfully shot emails :)"
        else
          puts "Email settings are not configured"
        end
      elsif due_today.present?
        notification  = Notification.find_by_name("Service date")
        emails        = tf.collect_emails_for_notification(notification)
        if emails.present? 
          puts "Shooting #{due_fleets.count} emails"
          UserMailer.service_today_reminder(due_today, emails).deliver
          puts "Successfully shot emails :)"
        else
          puts "Email settings are not configured"
        end
      elsif overdue_fleets.present?
        notification  = Notification.find_by_name("Overdue service")
        emails        = tf.collect_emails_for_notification(notification)
        if emails.present? 
          puts "Shooting #{due_fleets.count} emails"
          UserMailer.overdue_services_reminder(due_fleets, emails).deliver
          puts "Successfully shot emails :)"
        else
          puts "Email settings are not configured"
        end
      end
      puts "For TruckFleet: #{tf.name} there is #{overdue_fleets.count} overdue vehicles and #{due_today.count} that are due today"
      puts "==============================="
    end
    
  end

  desc ''
  task :send_service_date_reminder => :environment do
    
  end
end