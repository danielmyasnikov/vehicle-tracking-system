class Service < ActiveRecord::Base
  include ActiveModel::Validations
  # TODO: optimize the database => create has_many belongs_to relationship for serivice -> service_types
  attr_accessible :KM_since_last_service, :damage, :fleet_id, :repair, 
                  :repairer_id, :self_service, :service_type, 
                  :time_since_last_service, :warranty, :service, :breakdown,
                  :hours, :start_service_date, :finish_service_date,
                  :start_service_time, :finish_service_time, :other,
                  :service_done, :service_price, :warranty_done, :damage_done, 
                  :damage_price, :repair_done, :repair_price, :breakdown_done, 
                  :breakdown_price, :warranty_price, :service_type_name, :finalise,
                  :status, :parts, :services
  
  # validates_date :start_service_date
  belongs_to :fleet
  belongs_to :truck_fleet
  
  has_many :fleet_service_infos
  has_many :reports
  
  before_save :check_status
  
  def start_service_date?
    p 'yay callled'
    true
  end
  
  def check_status
    self.status = "ready" if self.service && self.service_done
    self.status = "ready" if self.warranty && self.warranty_done
    self.status = "ready" if self.damage && self.damage_done
    self.status = "ready" if self.breakdown && self.breakdown_done
    self.status = "ready" if self.damage && self.damage_done  
  end
end
