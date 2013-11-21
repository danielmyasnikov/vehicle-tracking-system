class Report < ActiveRecord::Base
  
  SERVICES = [:breakdown, :damage, :repair, :service, :services, :warranty, :parts]
  
  belongs_to :fleet
  belongs_to :support, :class_name => "Service", :foreign_key => :service_id
  belongs_to :fault_book
  attr_accessible :breakdown, :damage, :repair, :service, :warranty, :fleet_id, 
                  :service_id, :fleet, :name, :make, :model, :service_date, :datecode,
                  :services, :parts, :fault_flag, :fault_book_id
                  
                  
  def self.reports_for_pie_array(reports, parameters = nil, group_by = nil)      
    if group_by.nil? || group_by.to_sym == :fleet_id
      group_by ||= :fleet_id
      reports = reports.group(group_by).select("#{group_by.to_s}, SUM(repair) as repair, SUM(breakdown) as breakdown, SUM(service) as service, SUM(warranty) as warranty, SUM(damage) as damage, SUM(parts) as parts, SUM(services) as services").collect{|r| [r.fleet.name, r.parts.to_f + r.services.to_f + r.warranty.to_f + r.damage.to_f + r.service.to_f + r.repair.to_f + r.breakdown.to_f] }
    else
      my_hash = {}
      reports.pluck(group_by.to_sym).uniq.collect {|model_name| my_hash.merge!(model_name => reports.sum_by(reports.where(group_by.to_sym => model_name), parameters))}
      my_hash
    end
  end
  
  def self.reports_for_graph(reports, params = nil, group_by = nil)
    my_hash = {}
    group_by ||= :fleet_id
    
    datecodes = self.last_datecodes
    reports = reports.where(:datecode => datecodes)
    group_by_keys = reports.pluck(group_by)
    if group_by == :fleet_id
      group_by_keys.uniq.collect { |key| my_hash.merge!(Fleet.find(key).name => reports.sum_by_datecode_hash(reports.where(group_by.to_sym => key), params)) }
    else
      group_by_keys.uniq.collect { |key| my_hash.merge!(key => reports.sum_by_datecode_hash(reports.where(group_by.to_sym => key), params)) }
    end
    my_hash
  end
  
  def self.truck_fleet_reports(truck_fleet_id)
    if truck_fleet_id.present? && truck_fleet_id != ""
      reports = where(:fleet_id => Fleet.where(:truck_fleet_id => truck_fleet_id))
      reports
    else
      []
    end
  end
  
  def self.sum_by_datecode_hash reports, arr_of_args = nil
    summed_reports_hash = {}
    
    datecodes = reports.last_datecodes
    datecodes.each do |dc|
      summed_reports_hash.merge!({ dc => self.sum_by(reports.where(:datecode => dc), arr_of_args) })
    end
    
    arr = self.arr_of_last_12_months
    arr.collect! {|dc| summed_reports_hash.keys.include?(dc) ? summed_reports_hash[dc] : 0 }
    
    arr
  end
  
  # calculates all services fields from reports if no array of arguments is provided
  def self.sum_by reports, arr_of_args = nil   
    total = 0 
    raise ArgumentError, 'Arguments are not ACTIVE RELATION' unless reports.kind_of? ActiveRecord::Relation
    return SERVICES.collect {|s| total += reports.sum(s)}.last if arr_of_args.nil? || arr_of_args == ['all']
    return self.sum_by_array reports, arr_of_args if arr_of_args != ['all'] and arr_of_args.kind_of? Array
    return self.sum_by_one_arg reports, arr_of_args unless arr_of_args.kind_of? Array  
  end
  
  def self.sum_by_array reports, arr_of_args
    total = 0
    arr_of_args.collect!(&:to_sym)
    arr_of_args.each do |column|
      total += reports.sum(column)
    end
    total
  end
  
  def self.sum_by_one_arg reports, arr_of_args
    arg = arr_of_args
    arg = arg.to_sym
    reports.sum(arg)
  end
  
  # Note: you can store this in database and run Rake every 1st of every month to produce an array of last months
  def self.last_datecodes
    # for the graph we need last 12 monthsof the data
    last_month_to_count = (Date.today - 1.year).strftime("%Y%m").to_i
    
    # datecode is a db column that tracks the monthly date for recorded report
    datecodes = Report.pluck(:datecode).uniq.reject { |dc| dc if dc.to_i < last_month_to_count }.sort
  end
  
  def self.arr_of_last_12_months
    (0..12).collect { |x| (Date.today - x.months).strftime("%Y%m") }.sort
  end  
  
end
