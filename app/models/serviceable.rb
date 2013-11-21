class Serviceable < ActiveRecord::Base
  attr_accessible :fleet_id, :service_km_interval, :service_period, 
                  :service_time_interval, :service_type_id, :service_type, :next_service_date,
                  :start_date

  belongs_to :service_type
  belongs_to :fleet
  belongs_to :fault_book
  
  def cancel_service
    puts serviceable_period != 0 && next_service_date.present?
    self.next_service_date = next_service_date + service_time_interval.to_i * serviceable_period.to_i if serviceable_period != 0 && next_service_date.present?
    self.save
  end
  
  def serviceable_period
    case (service_period)
    when 'Year'
      365
    when 'Month'
      30
    when 'Day'
      1
    else 
      return 0
    end  
  end
  
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
  
  def self.due_in(date)
    self.where(:next_service_date => Date.today + date)
  end
  
  def self.overdue_in(date)
    self.where(:next_service_date => Date.today - date)
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
