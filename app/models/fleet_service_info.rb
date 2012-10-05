class FleetServiceInfo < ActiveRecord::Base
  attr_accessible :fleet_id, :km_since_last_service, :service_id, :time_since_last_service
  belongs_to :service
  belongs_to :fleet
end
