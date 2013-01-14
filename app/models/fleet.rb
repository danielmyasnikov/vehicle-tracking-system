class Fleet < ActiveRecord::Base
  attr_accessible :vin, :auto_services, :fleet_number, :make, :model, :pic,
                  :registration, :year, :truck_fleet_id, :km_estimates, :period,
                  :km_estimates, :period, :avatar, :service_frequency_number,
                  :service_frequency_period, :last_service_date, :next_service_date,
                  :vehicle_type, :other, :actual_km
  belongs_to :truck_fleet
  has_many :services
  has_many :fleet_services_infos
  has_many :drivers
  has_many :service_types, :through => :serviceables
  has_many :serviceables
  has_attached_file :avatar, :styles => {:medium => "300x300", :thumb => "40x40"}
  before_save :calc_next_service_date
  # => push all validation as the last step .... validates_presence_of :VIN, :make, :year, :truck_fleet_id
  def self.due
    where('next_service_date <= ? and next_service_date >= ?', Date.today + 3, Date.today).order("fleet_number ASC")
  end

  def self.overdue
    where('next_service_date < ?', Date.today).order("next_service_date ASC")
  end
  
  def name
    id = truck_fleet.setting.truck_identification
    send(id)
  end

  def calculated_service_period
    if service_frequency_period.present? && service_frequency_number.present?
      case(service_frequency_period)
      when 'Year'
        service_frequency_number.to_i.year
      when 'Month'
        service_frequency_number.to_i.month
      when 'Week'
        service_frequency_number.to_i.day * 7
      when 'Day'
        service_frequency_number.to_i.day
      end
    else
      return 0
    end
  end
  
  # TODO: refactor and merge with calculated_service_period
  def calc_next_period_for_services(service_frequency_number, service_frequency_period)
    if service_frequency_period.present? && service_frequency_number.present?
      case(service_frequency_period)
      when 'Year'
        service_frequency_number.to_i.year
      when 'Month'
        puts service_frequency_number.to_i.month
        service_frequency_number.to_i.month
      when 'Week'
        puts service_frequency_number.to_i.day * 7
        service_frequency_number.to_i.day * 7
      when 'Day'
        puts service_frequency_number.to_i.day
        service_frequency_number.to_i.day
      end
    else
      return 0
    end
  end
  
  def prepare_services
    ServiceType.all.each do |service_type|
      service_types << service_type if does_not_include service_type
    end
  end
  
  def build_fleet_services
    ServiceType.all.each do |service_type|
      serviceables.new(:service_type => service_type)
    end
  end
  
  def does_not_include(item)
    !service_types.include?(item)
  end
  
  def update_serviceables(params)
    if params.present?
      params.each do |key, value|
        s = serviceables.find_by_service_type_id(key)
        s.update_attributes(value)
        next_service = calc_next_period_for_services(value["service_time_interval"], value["service_period"])
        s.next_service_date = Date.today + next_service
        s.save
      end
    end
  end
  
  def calc_next_service_date
    self.next_service_date = last_service_date.present? ? calculated_time_estimation : row_time_estimation  
  end
  
  def calculated_time_estimation
    last_service_date + calculated_service_period
  end
  
  def row_time_estimation
    created_at ||= Date.today + calculated_service_period
  end
end
