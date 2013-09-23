class Fleet < ActiveRecord::Base
  attr_accessible :vin, :auto_services, :fleet_number, :make, :model, :pic,
                  :registration, :year, :truck_fleet_id, :km_estimates, :period,
                  :km_estimates, :period, :avatar, :service_frequency_number,
                  :service_frequency_period, :last_service_date, :next_service_date,
                  :vehicle_type, :other, :actual_km, :assets
  belongs_to :truck_fleet
  has_many :services
  has_many :fleet_services_infos
  has_many :drivers
  has_many :service_types, :through => :serviceables
  has_many :serviceables
  has_many :fault_books
  has_attached_file :avatar, :styles => {:medium => "300x300", :thumb => "40x40"}
  has_many :assets
  has_many :reports, dependent: :destroy
  # => push all validation as the last step .... validates_presence_of :VIN, :make, :year, :truck_fleet_id
  
  def cron_calc_milage
    self.actual_km = milage_sum
    self.save
  end
  
  def milage_sum
    actual_km.to_f + km_estimates.to_f / calc_days_for_milage_sum if calc_days_for_milage_sum != 0
  end
  
  def calc_days_for_milage_sum
    case period
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
  
  def name
    id = truck_fleet.setting.truck_identification
    send(id)
  end
  
  def service_price_by_months_array
    array_to_return = []
    services.each_with_index do |s, i|
      date2 = Date.today 
      date1 = s.finish_service_date
      date = (date2.year * 12 + date2.month) - (date1.year * 12 + date1.month)
      if date <= 10
        total_price = s.warranty_price.to_f + s.damage_price.to_f + s.service_price.to_f + s.repair_price.to_f + s.breakdown_price.to_f
        position = 12 - date
        array_to_return[position] = array_to_return[position] + total_price.to_f if !array_to_return[position].nil?
        array_to_return[position] = total_price.to_f if array_to_return[position].nil?
      end
    end
    array_to_return
  end
  
  def reports_price_by_months_array
    array_to_return = {}
    months = []
    warranty = []
    damage = []
    repair = []
    service = []
    breakdown = []
    # iterate the last 12 months
    12.downto(0).each do |x|
      months << x.months.ago.strftime("%b/%y")
      warranty << reports.where("created_at >= ? AND created_at <= ?", x.months.ago.at_beginning_of_month, x.months.ago.at_end_of_month).sum(:warranty)
      damage << reports.where("created_at >= ? AND created_at <= ?", x.months.ago.at_beginning_of_month, x.months.ago.at_end_of_month).sum(:damage)
      repair << reports.where("created_at >= ? AND created_at <= ?", x.months.ago.at_beginning_of_month, x.months.ago.at_end_of_month).sum(:repair)
      service << reports.where("created_at >= ? AND created_at <= ?", x.months.ago.at_beginning_of_month, x.months.ago.at_end_of_month).sum(:service)
      breakdown << reports.where("created_at >= ? AND created_at <= ?", x.months.ago.at_beginning_of_month, x.months.ago.at_end_of_month).sum(:breakdown)
    end
    puts "array to return"
    puts "array to return"
    array_to_return = { 
      :months => months,
      :warranty => warranty,
      :damage => damage,
      :repair => repair,
      :service => service,
      :breakdown => breakdown,
    }
  end
  
  def services_total
    total_price = 0
    services.each do |s|
      total_price += s.warranty_price.to_f + s.damage_price.to_f + s.service_price.to_f + s.repair_price.to_f + s.breakdown_price.to_f
    end
    total_price
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
  
  # TODO: refactor and merge with calculated_service_period and move it to serviceables
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
  
  def prepare_services user
    ServiceType.truck_fleet_scoped(user).each do |service_type|
      service_types << service_type if does_not_include service_type
    end
  end
  
  def build_fleet_services(current_user)
    ServiceType.scoped_by_user(current_user).each do |service_type|
      self.serviceables.new(:service_type => service_type).save
    end
  end
  
  def does_not_include(item)
    !service_types.include?(item)
  end
  
  def update_serviceables(params)
    if params.present?
      params.each do |key, value|
        s = serviceables.find_by_service_type_id(key)
        s.booked = false
        s.update_attributes(value)
        next_service = calc_next_period_for_services(value["service_time_interval"], value["service_period"])
        start_service_date = value["start_date"]
        start_date = Date.strptime(value["start_date"], "%d-%m-%Y") || Date.today
        s.next_service_date = start_date + next_service if value["service_time_interval"].present?
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
