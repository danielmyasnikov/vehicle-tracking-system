# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Truck Fleets
puts 'Creating Truck Fleets'
truck_fleet_1 = TruckFleet.create! :trading_name_of_business => 'Fleet Guard', :street => '14 Rodborough road', 
                                 :street_2 => '', 
                                 :suburb => 'French Forest', :state => 'NSW', :postcode => 2086

truck_fleet_2 = TruckFleet.create!  :trading_name_of_business => 'Guard Systems', :street => '2 Rodborough road', 
                                    :street_2 => '', 
                                    :suburb => 'French Forest', :state => 'NSW', :postcode => 2086

puts 'Successfully created: ' << truck_fleet_1.trading_name_of_business
puts 'Successfully created: ' << truck_fleet_2.trading_name_of_business

# Fleets
puts 'Creating Fleets'

fleet_1 = Fleet.create! :id => 1, :make => 'make_1', :model => 'model_2', :year => 1988, :VIN => 'ABC1243', 
                        :registration => 'rego_1', :fleet_number => '1234', :auto_services => false, 
                        :truck_fleet_id => 1

fleet_2 = Fleet.create! :id => 2, :make => 'make_2', :model => 'model_2', :year => 2005, :VIN => '12CDA43', 
                        :registration => 'rego_2', :fleet_number => '3455', :auto_services => true, 
                        :truck_fleet_id => 1

fleet_3 = Fleet.create! :id => 3, :make => 'make_1', :model => 'model_2', :year => 1988, :VIN => 'ABC1243', 
                        :registration => 'rego_1', :fleet_number => '1234', :auto_services => false, 
                        :truck_fleet_id => 1

fleet_4 = Fleet.create! :id => 4, :make => 'make_1', :model => 'model_2', :year => 2005, :VIN => '12CDA43', 
                        :registration => 'rego_2', :fleet_number => '3455', :auto_services => true, 
                        :truck_fleet_id => 1


puts 'Successfully created: ' << fleet_1.model
puts 'Successfully created: ' << fleet_2.model
puts 'Successfully created: ' << fleet_3.model
puts 'Successfully created: ' << fleet_4.model

# repairer
puts 'Creating repairers'

repairer = Repairer.create! :id => 1, :business_name => 'Repairer_1',
                            :street_address_1 => '_9 Wearden St.', :street_address_2 => '', :suburb => 'Belrose', 
                            :state => 'NSW', :postcode => 2085, :hour_service_24 => true, 
                            :phone_number => '+61 449 904 777'
                            
repairer_2 = Repairer.create! :id => 2, :business_name => 'Repairer_2',
                            :street_address_1 => '9 George St.', :street_address_2 => '', :suburb => 'Ryde', 
                            :state => 'NSW', :postcode => 2112, :hour_service_24 => true, 
                            :phone_number => '+61 449 904 777'

puts 'Successfully created: ' << repairer.business_name
puts 'Successfully created: ' << repairer_2.business_name

# services
puts 'Creating serivces'

service_1 = Service.create! :id => 1, :fleet_id => 3, :repairer_id => 1, 
                            :service_type => 'Scheduled', :warranty => "N/A", :damage => 'N/A', 
                            :repair => 'N/A', :self_service => false, :KM_since_last_service => 1000, 
                            :time_since_last_service => 240
                            
service_2 = Service.create! :id => 2, :fleet_id => 2, :repairer_id => 1, 
                            :service_type => 'Scheduled', :warranty => "N/A", :damage => 'N/A', 
                            :repair => 'N/A', :self_service => false, :KM_since_last_service => 1000, 
                            :time_since_last_service => 240

puts 'Successfully created: ' << service_1.fleet_id
puts 'Successfully created: ' << service_2.fleet_id
=begin
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'Administrator', :email => 'admin@example.com', 
                    :password => 'pa$$w0rd', :password_confirmation => 'pa$$w0rd', :approved => true
puts 'New user created: ' << user.name
user2 = User.create! :name => 'User', :email => 'user@example.com', 
                     :password => 'password', :password_confirmation => 'password', :approved => true
puts 'New user created: ' << user2.name
user.add_role :admin
=end