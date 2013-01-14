class TruckFleet < ActiveRecord::Base
  attr_accessible :postcode, :state, :street, :street_2, :suburb, 
                  :trading_name_of_business, :contact_truck_fleets_attributes,
                  :avatar
                  
  has_many :contact_truck_fleets, :dependent => :destroy
  has_many :fleets
  has_many :drivers
  has_many :repairers
  has_attached_file :avatar, :styles => {:medium => "300x300", :thumb => "40x40"}
  accepts_nested_attributes_for :contact_truck_fleets, :reject_if => lambda { |a| a[:email].blank? }, :allow_destroy => true
  has_one :setting
  has_many :users
  
  def self.find_contacts_by_fleet_id(fleet_id)
    fleet = Fleet.find(fleet_id)
    fleet.truck_fleet.contact_truck_fleets.pluck(:email)
  end
  
  def self.scoped_by_vehicle
    @truck_fleets = {}
    scoped.each do |tf|
      @truck_fleets.merge!({tf => tf.fleets.order("fleet_number ASC")})
    end
    return @truck_fleets
  end
end
