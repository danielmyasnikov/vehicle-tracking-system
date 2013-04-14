class Report < ActiveRecord::Base
  belongs_to :fleet
  belongs_to :support, :class_name => "Service", :foreign_key => :service_id
  attr_accessible :breakdown, :damage, :repair, :service, :warranty, :fleet_id, 
                  :service_id, :fleet
                  
  def self.summed_values
    [:warranty].zip(reports[:service], reports[:breakdown], reports[:repair], reports[:damage]).map {|e| e.map(&:to_i).inject(&:+) }
  end
end
