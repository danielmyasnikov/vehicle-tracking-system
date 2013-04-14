class Report < ActiveRecord::Base
  belongs_to :fleet
  belongs_to :support, :class_name => "Service", :foreign_key => :service_id
  attr_accessible :breakdown, :damage, :repair, :service, :warranty, :fleet_id, 
                  :service_id, :fleet
end
