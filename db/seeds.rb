# encoding: utf-8
# Autogenerated by the db:seed:dump task
# Do not hesitate to tweak this to your needs

ContactRepairer.create([
  { :name => "Mark Franks", :email => "mark.franks@sxtrailers.com.au", :phone => "0403018748", :repairer_id => 1, :created_at => "2012-12-11 02:26:55", :updated_at => "2012-12-11 02:26:55" },
  { :name => "", :email => "", :phone => "", :repairer_id => 1, :created_at => "2012-12-11 02:26:55", :updated_at => "2012-12-11 02:26:55" },
  { :name => "", :email => "", :phone => "", :repairer_id => 1, :created_at => "2012-12-11 02:26:55", :updated_at => "2012-12-11 02:26:55" },
  { :name => "Anthony Furina", :email => "Anthony.Furina@mack.com.au", :phone => "0142 225855", :repairer_id => 2, :created_at => "2012-12-11 02:29:13", :updated_at => "2012-12-11 02:29:13" },
  { :name => "", :email => "", :phone => "", :repairer_id => 2, :created_at => "2012-12-11 02:29:13", :updated_at => "2012-12-11 02:29:13" },
  { :name => "", :email => "", :phone => "", :repairer_id => 2, :created_at => "2012-12-11 02:29:13", :updated_at => "2012-12-11 02:29:13" },
  { :name => "Tom Jones", :email => "", :phone => "0142 225855", :repairer_id => 3, :created_at => "2012-12-11 02:29:20", :updated_at => "2012-12-11 02:30:22" },
  { :name => "", :email => "", :phone => "", :repairer_id => 3, :created_at => "2012-12-11 02:29:20", :updated_at => "2012-12-11 02:29:20" },
  { :name => "", :email => "", :phone => "", :repairer_id => 3, :created_at => "2012-12-11 02:29:20", :updated_at => "2012-12-11 02:29:20" },
  { :name => "", :email => "", :phone => "", :repairer_id => 4, :created_at => "2012-12-12 06:17:13", :updated_at => "2012-12-12 06:17:13" },
  { :name => "", :email => "", :phone => "", :repairer_id => 4, :created_at => "2012-12-12 06:17:13", :updated_at => "2012-12-12 06:17:13" },
  { :name => "", :email => "", :phone => "", :repairer_id => 4, :created_at => "2012-12-12 06:17:13", :updated_at => "2012-12-12 06:17:13" }
], :without_protection => true )



ContactTruckFleet.create([
  { :main => nil, :title => nil, :mobile => nil, :email => nil, :truck_fleet_id => 1, :created_at => "2012-12-11 01:56:49", :updated_at => "2012-12-11 01:56:49" },
  { :main => nil, :title => nil, :mobile => nil, :email => nil, :truck_fleet_id => 2, :created_at => "2012-12-11 02:02:02", :updated_at => "2012-12-11 02:02:02" },
  { :main => nil, :title => nil, :mobile => nil, :email => nil, :truck_fleet_id => 3, :created_at => "2012-12-12 06:12:03", :updated_at => "2012-12-12 06:12:03" }
], :without_protection => true )



Driver.create([
  { :name => "Tony Jones", :phone_no => "0144 789 789", :pic => "", :dl_number => "DL2358254", :dl_expiry => "2015-03-07", :training_schedule => "", :training_documents => "", :created_at => "2012-12-11 02:25:07", :updated_at => "2012-12-11 02:25:07", :fleet_id => nil },
  { :name => "Peter Pan", :phone_no => "0282 123 123", :pic => "", :dl_number => "DL15815874", :dl_expiry => "2014-12-11", :training_schedule => "", :training_documents => "", :created_at => "2012-12-11 02:25:51", :updated_at => "2012-12-11 02:25:51", :fleet_id => nil }
], :without_protection => true )



Fleet.create([
  { :pic => "text_field", :make => "Fiat", :model => "Ducato", :year => 2006, :vin => "ZFA24400007833611", :registration => "AT42VS", :fleet_number => "SV001", :auto_services => true, :created_at => "2012-12-11 01:59:17", :updated_at => "2012-12-11 03:16:18", :truck_fleet_id => 1, :km_estimates => 0.0, :period => "Year", :avatar_file_name => nil, :avatar_content_type => nil, :avatar_file_size => nil, :avatar_updated_at => nil, :service_frequency_period => "Month", :service_frequency_number => "Enter Date Frequency Estimates", :last_service_date => nil, :next_service_date => "2012-12-09", :vehicle_type => "Ute" },
  { :pic => "text_field", :make => "Ford", :model => "Falcon G6", :year => 2010, :vin => "6FPAAAJGSWAA64181", :registration => "BWD04F", :fleet_number => "AV002", :auto_services => true, :created_at => "2012-12-11 02:01:19", :updated_at => "2012-12-11 03:16:56", :truck_fleet_id => 1, :km_estimates => 0.0, :period => "Year", :avatar_file_name => nil, :avatar_content_type => nil, :avatar_file_size => nil, :avatar_updated_at => nil, :service_frequency_period => "Month", :service_frequency_number => "Enter Date Frequency Estimates", :last_service_date => nil, :next_service_date => "2012-12-09", :vehicle_type => "Car" },
  { :pic => "text_field", :make => "Toyota", :model => "Hilux", :year => 2001, :vin => "6T153BK400X003337", :registration => "BJ40FH", :fleet_number => "PV001", :auto_services => true, :created_at => "2012-12-11 02:03:02", :updated_at => "2012-12-11 02:34:46", :truck_fleet_id => 2, :km_estimates => 0.0, :period => "Week", :avatar_file_name => nil, :avatar_content_type => nil, :avatar_file_size => nil, :avatar_updated_at => nil, :service_frequency_period => "Day", :service_frequency_number => "Enter Date Frequency Estimates", :last_service_date => nil, :next_service_date => "2012-12-11", :vehicle_type => "Ute" },
  { :pic => "text_field", :make => "Ferrari", :model => "458", :year => 2012, :vin => "CRKL4458438793457", :registration => "ALZ458", :fleet_number => "BV000", :auto_services => true, :created_at => "2012-12-11 02:04:19", :updated_at => "2012-12-12 02:01:49", :truck_fleet_id => 2, :km_estimates => 2000.0, :period => "Month", :avatar_file_name => nil, :avatar_content_type => nil, :avatar_file_size => nil, :avatar_updated_at => nil, :service_frequency_period => "Week", :service_frequency_number => "12", :last_service_date => nil, :next_service_date => "21883-08-01", :vehicle_type => "Car" },
  { :pic => "text_field", :make => "Freighter", :model => "ST3", :year => 2009, :vin => "6F8T250000B018970", :registration => "U68985", :fleet_number => "TL002", :auto_services => true, :created_at => "2012-12-11 02:36:40", :updated_at => "2012-12-11 02:36:40", :truck_fleet_id => 1, :km_estimates => 15000.0, :period => "Year", :avatar_file_name => nil, :avatar_content_type => nil, :avatar_file_size => nil, :avatar_updated_at => nil, :service_frequency_period => "Year", :service_frequency_number => "Enter Date Frequency Estimates", :last_service_date => nil, :next_service_date => "2012-12-11", :vehicle_type => "Trailer" },
  { :pic => "text_field", :make => "Compressor", :model => "Sullair", :year => 2006, :vin => "COSULL456988", :registration => "COMP", :fleet_number => "COMP", :auto_services => true, :created_at => "2012-12-11 02:39:13", :updated_at => "2012-12-11 02:39:13", :truck_fleet_id => 1, :km_estimates => 0.0, :period => "Year", :avatar_file_name => nil, :avatar_content_type => nil, :avatar_file_size => nil, :avatar_updated_at => nil, :service_frequency_period => "Year", :service_frequency_number => "1", :last_service_date => nil, :next_service_date => "2013-12-11", :vehicle_type => "Other-Machinery" },
  { :pic => "text_field", :make => "Make2", :model => "Model3", :year => 2001, :vin => "34567", :registration => "2345678", :fleet_number => "VO092", :auto_services => true, :created_at => "2012-12-12 06:13:13", :updated_at => "2012-12-12 06:13:13", :truck_fleet_id => 3, :km_estimates => 15000.0, :period => "Year", :avatar_file_name => nil, :avatar_content_type => nil, :avatar_file_size => nil, :avatar_updated_at => nil, :service_frequency_period => "Month", :service_frequency_number => "6", :last_service_date => nil, :next_service_date => "2013-06-12", :vehicle_type => "Forklift" }
], :without_protection => true )



FleetServiceInfo.create([
  { :fleet_id => nil, :service_id => nil, :km_since_last_service => nil, :time_since_last_service => nil, :created_at => nil, :updated_at => nil }
], :without_protection => true )



Repairer.create([
  { :business_name => "SX Trailers", :picture => nil, :street_address_1 => nil, :street_address_2 => nil, :suburb => nil, :state => nil, :postcode => nil, :hour_service_24 => false, :phone_number => "02 97553333", :created_at => "2012-12-11 02:26:55", :updated_at => "2012-12-11 02:26:55", :avatar_file_name => nil, :avatar_content_type => nil, :avatar_file_size => nil, :avatar_updated_at => nil, :latitude => -33.926038, :longitude => 150.966721, :gmaps => nil, :full_address => "16 - 18 Riverside Rd Chipping Norton" },
  { :business_name => "Mack Trucks", :picture => nil, :street_address_1 => nil, :street_address_2 => nil, :suburb => nil, :state => nil, :postcode => nil, :hour_service_24 => false, :phone_number => "02 9725 2222", :created_at => "2012-12-11 02:29:13", :updated_at => "2012-12-11 02:29:13", :avatar_file_name => nil, :avatar_content_type => nil, :avatar_file_size => nil, :avatar_updated_at => nil, :latitude => -33.923147, :longitude => 150.9625715, :gmaps => nil, :full_address => "5 Alfred Rd Chipping Norton" },
  { :business_name => "Toms Trailers", :picture => nil, :street_address_1 => nil, :street_address_2 => nil, :suburb => nil, :state => nil, :postcode => nil, :hour_service_24 => false, :phone_number => "02 9725 2222", :created_at => "2012-12-11 02:29:20", :updated_at => "2012-12-11 02:30:22", :avatar_file_name => nil, :avatar_content_type => nil, :avatar_file_size => nil, :avatar_updated_at => nil, :latitude => -33.791043, :longitude => 150.877444, :gmaps => nil, :full_address => "14 Lidco St Arndell Park" },
  { :business_name => "Amin Repairer", :picture => nil, :street_address_1 => nil, :street_address_2 => nil, :suburb => nil, :state => nil, :postcode => nil, :hour_service_24 => false, :phone_number => "", :created_at => "2012-12-12 06:17:13", :updated_at => "2012-12-12 06:17:13", :avatar_file_name => nil, :avatar_content_type => nil, :avatar_file_size => nil, :avatar_updated_at => nil, :latitude => -33.9230231, :longitude => 151.2271819, :gmaps => nil, :full_address => "333 Anzac pde, kingsford" }
], :without_protection => true )



Role.create([
  { :name => nil, :resource_id => nil, :resource_type => nil, :created_at => nil, :updated_at => nil }
], :without_protection => true )



Service.create([
  { :fleet_id => 6, :repairer_id => 1, :service_type => "Scheduled", :self_service => false, :KM_since_last_service => nil, :time_since_last_service => nil, :created_at => "2012-12-11 02:40:53", :updated_at => "2012-12-11 02:40:53", :start_service_date => "2012-12-13", :finish_service_date => "2012-12-13", :start_service_time => "2000-01-01 12:00:00", :finish_service_time => "2000-01-01 14:00:00", :name => nil, :warranty => false, :damage => false, :repair => false, :breakdown => false, :other => "Standard service\r\nOrder number 12569", :service_price => nil, :repair_price => nil, :warranty_price => nil, :damage_price => nil, :breakdown_price => nil, :service => true, :hours => 2, :service_done => nil, :repair_done => nil, :warranty_done => nil, :damage_done => nil, :breakdown_done => nil },
  { :fleet_id => 1, :repairer_id => 1, :service_type => "Scheduled", :self_service => false, :KM_since_last_service => nil, :time_since_last_service => nil, :created_at => "2012-12-11 02:47:33", :updated_at => "2012-12-11 02:47:33", :start_service_date => "2012-12-10", :finish_service_date => "2012-12-10", :start_service_time => "2000-01-01 08:00:00", :finish_service_time => "2000-01-01 12:00:00", :name => nil, :warranty => true, :damage => false, :repair => false, :breakdown => false, :other => "", :service_price => nil, :repair_price => nil, :warranty_price => nil, :damage_price => nil, :breakdown_price => nil, :service => false, :hours => 4, :service_done => nil, :repair_done => nil, :warranty_done => nil, :damage_done => nil, :breakdown_done => nil },
  { :fleet_id => 3, :repairer_id => 1, :service_type => "Scheduled", :self_service => false, :KM_since_last_service => nil, :time_since_last_service => nil, :created_at => "2012-12-11 02:47:51", :updated_at => "2012-12-11 02:47:51", :start_service_date => "2012-12-11", :finish_service_date => "2012-12-11", :start_service_time => "2000-01-01 12:00:00", :finish_service_time => "2000-01-01 14:00:00", :name => nil, :warranty => true, :damage => false, :repair => false, :breakdown => false, :other => "", :service_price => nil, :repair_price => nil, :warranty_price => nil, :damage_price => nil, :breakdown_price => nil, :service => false, :hours => 2, :service_done => nil, :repair_done => nil, :warranty_done => nil, :damage_done => nil, :breakdown_done => nil },
  { :fleet_id => 6, :repairer_id => 1, :service_type => "Unscheduled", :self_service => false, :KM_since_last_service => nil, :time_since_last_service => nil, :created_at => "2012-12-11 02:48:10", :updated_at => "2012-12-11 02:48:10", :start_service_date => "2012-12-15", :finish_service_date => "2012-12-15", :start_service_time => "2000-01-01 08:00:00", :finish_service_time => "2000-01-01 12:00:00", :name => nil, :warranty => true, :damage => false, :repair => false, :breakdown => false, :other => "", :service_price => nil, :repair_price => nil, :warranty_price => nil, :damage_price => nil, :breakdown_price => nil, :service => false, :hours => 4, :service_done => nil, :repair_done => nil, :warranty_done => nil, :damage_done => nil, :breakdown_done => nil },
  { :fleet_id => 3, :repairer_id => 2, :service_type => "Scheduled", :self_service => false, :KM_since_last_service => nil, :time_since_last_service => nil, :created_at => "2012-12-12 06:05:09", :updated_at => "2012-12-12 06:05:09", :start_service_date => "2012-12-13", :finish_service_date => "2012-12-13", :start_service_time => "2000-01-01 08:00:00", :finish_service_time => "2000-01-01 11:00:00", :name => nil, :warranty => true, :damage => true, :repair => false, :breakdown => true, :other => "", :service_price => nil, :repair_price => nil, :warranty_price => nil, :damage_price => nil, :breakdown_price => nil, :service => false, :hours => 3, :service_done => nil, :repair_done => nil, :warranty_done => nil, :damage_done => nil, :breakdown_done => nil },
  { :fleet_id => 7, :repairer_id => 3, :service_type => "Scheduled", :self_service => false, :KM_since_last_service => nil, :time_since_last_service => nil, :created_at => "2012-12-12 06:15:28", :updated_at => "2012-12-12 06:15:28", :start_service_date => "2012-12-16", :finish_service_date => "2012-12-16", :start_service_time => "2000-01-01 14:00:00", :finish_service_time => "2000-01-01 16:00:00", :name => nil, :warranty => true, :damage => false, :repair => false, :breakdown => false, :other => "", :service_price => nil, :repair_price => nil, :warranty_price => nil, :damage_price => nil, :breakdown_price => nil, :service => false, :hours => 2, :service_done => nil, :repair_done => nil, :warranty_done => nil, :damage_done => nil, :breakdown_done => nil },
  { :fleet_id => 3, :repairer_id => 3, :service_type => "Unscheduled", :self_service => true, :KM_since_last_service => nil, :time_since_last_service => nil, :created_at => "2012-12-12 08:09:24", :updated_at => "2012-12-12 08:09:24", :start_service_date => "2012-12-12", :finish_service_date => "2012-12-12", :start_service_time => "2000-01-01 18:00:00", :finish_service_time => "2000-01-01 02:00:00", :name => nil, :warranty => true, :damage => false, :repair => false, :breakdown => false, :other => "Hi I'm going on leave.", :service_price => nil, :repair_price => nil, :warranty_price => nil, :damage_price => nil, :breakdown_price => nil, :service => false, :hours => 8, :service_done => nil, :repair_done => nil, :warranty_done => nil, :damage_done => nil, :breakdown_done => nil }
], :without_protection => true )



Setting.create([
  { :truck_identification => "Registration", :email_periods => "Daily", :email_recepient_id => nil, :created_at => "2012-12-11 02:06:01", :updated_at => "2012-12-11 02:19:38", :truck_fleet_id => 2 },
  { :truck_identification => "Registration", :email_periods => "Tuesdays & Thursdays", :email_recepient_id => nil, :created_at => "2012-12-12 06:14:56", :updated_at => "2012-12-12 06:14:56", :truck_fleet_id => 3 },
  { :truck_identification => "fleet_number", :email_periods => "Daily", :email_recepient_id => nil, :created_at => "2012-12-11 02:05:37", :updated_at => "2012-12-13 06:47:55", :truck_fleet_id => 1 }
], :without_protection => true )



Subscriber.create([
  { :subscribtion_id => nil, :user_id => nil, :stop_this_email => nil, :unsubscribe => nil, :created_at => nil, :updated_at => nil }
], :without_protection => true )



Subscribtion.create([
  { :name => nil, :created_at => nil, :updated_at => nil }
], :without_protection => true )



Training.create([
  { :name => nil, :date => nil, :start_time => nil, :finish_time => nil, :driver_id => nil, :created_at => nil, :updated_at => nil }
], :without_protection => true )



TruckFleet.create([
  { :trading_name_of_business => "Alec Distribution Pty Ltd", :street => "1", :street_2 => "23 Smith", :suburb => "Point Piper", :state => "NSW", :postcode => 2027, :created_at => "2012-12-11 01:56:49", :updated_at => "2012-12-11 01:56:49", :avatar_file_name => "276426_191447010890763_120973852_q.jpg", :avatar_content_type => "image/jpeg", :avatar_file_size => 2370, :avatar_updated_at => "2012-12-11 01:56:49" },
  { :trading_name_of_business => "JJL Container Transport", :street => "36", :street_2 => " Riverside Rd", :suburb => "Chipping Norton", :state => "NSW", :postcode => 2170, :created_at => "2012-12-11 02:02:02", :updated_at => "2012-12-11 02:02:02", :avatar_file_name => nil, :avatar_content_type => nil, :avatar_file_size => nil, :avatar_updated_at => nil },
  { :trading_name_of_business => "AGA TruckFleet", :street => "1/1 Rossi", :street_2 => "Northbound", :suburb => "South Hurstville", :state => "NSW", :postcode => 2221, :created_at => "2012-12-12 06:12:03", :updated_at => "2012-12-12 06:12:03", :avatar_file_name => nil, :avatar_content_type => nil, :avatar_file_size => nil, :avatar_updated_at => nil }
], :without_protection => true )

# application specific data

puts 'SETTING UP NOTIFICATIONS'
Notification.create! :name => 'Update vehicle info except milage'
Notification.create! :name => 'Cancel service'
Notification.create! :name => 'Postponed service'
Notification.create! :name => 'Due service'
Notification.create! :name => 'Overdue service', :required_interval => true
Notification.create! :name => 'Completed booking'
Notification.create! :name => 'Date of booking'
Notification.create! :name => 'Pre booking reminder', :required_interval => true
Notification.create! :name => 'Service date'
Notification.create! :name => 'Service information incomplete'
Notification.create! :name => 'Service done'
Notification.create! :name => 'Updated / Rescheduled service'

puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'Administrator', :email => 'admin@example.com', 
                    :password => 'pa$$w0rd', :password_confirmation => 'pa$$w0rd', :approved => true
puts 'New user created: ' << user.name
user2 = User.create! :name => 'User', :email => 'user@example.com', 
                     :password => 'password', :password_confirmation => 'password', :approved => true
puts 'New user created: ' << user2.name
user.add_role :admin

