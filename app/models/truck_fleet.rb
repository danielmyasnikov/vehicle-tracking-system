class TruckFleet < ActiveRecord::Base
  attr_accessible :postcode, :state, :street, :street_2, :suburb, 
                  :trading_name_of_business, :contact_truck_fleets_attributes,
                  :avatar
                  
  has_many :contact_truck_fleets, :dependent => :destroy
  has_many :fleets
  has_attached_file :avatar, :styles => {:medium => "300x300", :thumb => "40x40"}
  accepts_nested_attributes_for :contact_truck_fleets, :reject_if => lambda { |a| a[:email].blank? }, :allow_destroy => true
  has_one :setting
  
  def self.find_contacts_by_fleet_id(fleet_id)
    fleet = Fleet.find(fleet_id)
    fleet.truck_fleet.contact_truck_fleets.pluck(:email)
  end
end
