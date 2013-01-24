class Serviceable < ActiveRecord::Base
  attr_accessible :fleet_id, :service_km_interval, :service_period, 
                  :service_time_interval, :service_type_id, :service_type, :next_service_date

  belongs_to :service_type
  belongs_to :fleet
  
  def self.update_services(fleet, params)
    if params.present? && fleet.present?
      fleet.serviceables.each do |fs|
        fs.update_attributes(params[fs.service_type.id.to_s])
        UserMailer.postponed_service(fleet).deliver
      end
    end
  end
  
  def self.due(fleets_ids)
    if fleets_ids.present?
      serviceables = Serviceable.where(:fleet_id => fleets_ids)
      serviceables.where('next_service_date <= ? and next_service_date >= ?', Date.today + 3, Date.today)
    end
  end
  
  def due?
    next_service_date <= Date.today + 3 && next_service_date > Date.today if next_service_date.present?
  end
  
  def today?
    next_service_date == Date.today if next_service_date.present?
  end
  
  def self.overdue(fleets_ids)
    if fleets_ids.present?
      serviceables = where(:fleet_id => fleets_ids)
      serviceables.where('next_service_date < ?', Date.today).order("next_service_date ASC")
    end
  end
  
  def overdue?
    next_service_date < Date.today if next_service_date.present?
  end
end
