class Report < ActiveRecord::Base
  belongs_to :fleet
  belongs_to :support, :class_name => "Service", :foreign_key => :service_id
  attr_accessible :breakdown, :damage, :repair, :service, :warranty, :fleet_id, 
                  :service_id, :fleet, :name, :make, :model, :service_date, :datecode
                  
                  
  def self.reports_for_pie_array(parameters, reports)
    !parameters[:filter].nil? ? type = parameters[:filter][:type] : type = "name"
    puts "=> type"
    puts type.inspect
    if (type == "name")
      reports = reports.group(:fleet_id).select("fleet_id, SUM(repair) as repair, SUM(breakdown) as breakdown, SUM(service) as service, SUM(warranty) as warranty, SUM(damage) as damage").collect{|r| [r.fleet.name, r.warranty.to_f + r.damage.to_f + r.service.to_f + r.repair.to_f + r.breakdown.to_f] if r.fleet.present?}
    elsif (type == "model")
      reports = reports.group(:model).select("model, SUM(repair) as repair, SUM(breakdown) as breakdown, SUM(service) as service, SUM(warranty) as warranty, SUM(damage) as damage").collect{|r| [r.model, r.warranty.to_f + r.damage.to_f + r.service.to_f + r.repair.to_f + r.breakdown.to_f] if r.fleet.present?}
    elsif(type == "make")
      reports = reports.group(:make).select("make, SUM(repair) as repair, SUM(breakdown) as breakdown, SUM(service) as service, SUM(warranty) as warranty, SUM(damage) as damage").collect{|r| [r.make, r.warranty.to_f + r.damage.to_f + r.service.to_f + r.repair.to_f + r.breakdown.to_f] if r.fleet.present?}
    end
  end
  
  def self.reports_for_graph(params, reports)
    reports = Report.scoped
    report = reports.group(:make, :datecode).select("make, SUM(repair) as repair, SUM(breakdown) as breakdown, SUM(service) as service, SUM(warranty) as warranty, SUM(damage) as damage, datecode").order('datecode ASC').collect{|r| {r.make => {:total => r.warranty.to_f + r.damage.to_f + r.service.to_f + r.repair.to_f + r.breakdown.to_f, :datecode => r.datecode}}}
    entries = Report.pluck(:make).uniq
    hash = Hash.new {|h,k| h[k] = []}
    # creates a hash of values that are equal to empty array
    entries.each do |value|
      hash[value] = []
    end
    hash.each do |key, value|
      report.each do |entry| 
        hash[key] << [entry[entry.keys[0]][:total], entry[entry.keys[0]][:datecode]] if key == entry.keys[0]
      end
    end
    
    array_lastMonths = []
    (0..12).each do |r|
      array_lastMonths << (Date.today - r.months).strftime("%Y%m")
    end
    array_lastMonths.sort!
    
    entries.each do |e|
      array_to_return = [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
      hash[e].each do |item|
        index = array_lastMonths.index(item[1])
        p index
        array_to_return.delete_at(index)
        array_to_return.insert(index, item[0])
      end
      array_to_return.collect!{|r| r.to_i }
      hash[e] = array_to_return
    end
    return hash
  end
end