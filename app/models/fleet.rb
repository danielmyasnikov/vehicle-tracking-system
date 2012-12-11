class Fleet < ActiveRecord::Base
  attr_accessible :VIN, :auto_services, :fleet_number, :make, :model, :pic,
                  :registration, :year, :truck_fleet_id, :km_estimates, :period,
                  :km_estimates, :period, :avatar, :service_frequency_number,
                  :service_frequency_period, :last_service_date, :next_service_date,
                  :vehicle_type
  belongs_to :truck_fleet
  has_many :services
  has_many :fleet_services_infos
  has_many :drivers
  has_attached_file :avatar, :styles => {:medium => "300x300", :thumb => "40x40"}
  before_save :calc_next_service_date
  # => push all validation as the last step .... validates_presence_of :VIN, :make, :year, :truck_fleet_id
  def self.due
    where('next_service_date <= ? and next_service_date >= ?', Date.today + 3, Date.today).order("next_service_date ASC")
  end

  def self.overdue
    where('next_service_date < ?', Date.today).order("next_service_date ASC")
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
