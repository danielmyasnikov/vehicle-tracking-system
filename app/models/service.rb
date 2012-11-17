class Service < ActiveRecord::Base
  attr_accessible :KM_since_last_service, :damage, :fleet_id, :repair, 
                  :repairer_id, :self_service, :service_type, 
                  :time_since_last_service, :warranty, :service, :breakdown,
                  :hours, :start_service_date, :finish_service_date,
                  :start_service_time, :finish_service_time, :other
                  
  belongs_to :fleet
  has_many :fleet_service_infos
end
