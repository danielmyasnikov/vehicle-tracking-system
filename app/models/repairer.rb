class Repairer < ActiveRecord::Base
  attr_accessible :hour_service_24, :business_name, :phone_number, :picture, 
                  :postcode, :state, :street_address_1, :street_address_2, :suburb, 
                  :contact_repairers_attributes
  has_many :contact_repairers, :dependent => :destroy
  accepts_nested_attributes_for :contact_repairers
  has_many :services
end
