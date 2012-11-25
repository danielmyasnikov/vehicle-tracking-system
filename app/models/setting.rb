class Setting < ActiveRecord::Base
  attr_accessible :email_periods, :email_recepient_id, :truck_identification, 
                  :truck_fleet_id
                  
  belongs_to :truck_fleet
  validates_uniqueness_of :truck_fleet_id 
end
