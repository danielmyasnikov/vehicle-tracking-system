class Fleet < ActiveRecord::Base
  attr_accessible :VIN, :auto_services, :fleet_number, :make, :model, :pic, 
                  :registration, :year, :truck_fleet_id, :km_estimates, :period,
                  :km_estimates, :period
  belongs_to :truck_fleet
  has_many :services
  has_many :fleet_services_infos
  has_many :drivers
  
  # => push all validation as the last step .... validates_presence_of :VIN, :make, :year, :truck_fleet_id
end
