class Report < ActiveRecord::Base
  belongs_to :fleet
  belongs_to :service
  attr_accessible :breakdown, :damage, :repair, :service, :warranty, :fleet_id, 
                  :service_id, :fleet
end
