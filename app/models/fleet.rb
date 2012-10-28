class Fleet < ActiveRecord::Base
  attr_accessible :VIN, :auto_services, :fleet_number, :make, :model, :pic, :registration, :year, :truck_fleet_id
  belongs_to :truck_fleet
  has_many :services
  has_many :fleet_services_infos
  
  # => push all validation as the last step .... validates_presence_of :VIN, :make, :year, :truck_fleet_id
end
