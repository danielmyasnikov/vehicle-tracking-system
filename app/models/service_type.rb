class ServiceType < ActiveRecord::Base
  attr_accessible :name
  validates_uniqueness_of :name
  has_many :fleets, :through => :serviceables
  has_many :serviceables
  
  belongs_to :truck_fleet
  
  def self.truck_fleet_scoped(current_user)
    current_user.truck_fleet.service_types
  end
end
