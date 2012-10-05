class ContactTruckFleet < ActiveRecord::Base
  attr_accessible :email, :main, :mobile, :title, :truck_fleet_id
  belongs_to :truck_fleet
end
