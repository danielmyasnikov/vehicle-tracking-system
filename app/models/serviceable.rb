class Serviceable < ActiveRecord::Base
  attr_accessible :fleet_id, :service_km_interval, :service_period, 
                  :service_time_interval, :service_type_id, :service_type

  belongs_to :service_type
  belongs_to :fleet
  
  def self.update_services(fleet, params)
    if params.present? && fleet.present?
      fleet.serviceables.each do |fs|
        fs.update_attributes(params[fs.service_type.id.to_s])
      end
    end
  end
end
