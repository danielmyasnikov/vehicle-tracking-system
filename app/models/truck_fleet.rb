class TruckFleet < ActiveRecord::Base
  attr_accessible :postcode, :state, :street, :street_2, :suburb, :trading_name_of_business, :contact_truck_fleets_attributes
  has_many :contact_truck_fleets, :dependent => :destroy
  has_many :fleets
  accepts_nested_attributes_for :contact_truck_fleets, :reject_if => lambda { |a| a[:email].blank? }, :allow_destroy => true
  
end
