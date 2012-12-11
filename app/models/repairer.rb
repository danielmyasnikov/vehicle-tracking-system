class Repairer < ActiveRecord::Base
  attr_accessible :hour_service_24, :business_name, :phone_number, :picture, 
                  :postcode, :state, :street_address_1, :street_address_2, :suburb, 
                  :contact_repairers_attributes, :avatar, :full_address
  has_many :contact_repairers, :dependent => :destroy
  accepts_nested_attributes_for :contact_repairers
  has_many :services
  has_attached_file :avatar, :styles => {:medium => "300x300", :thumb => "40x40"}
  geocoded_by :full_address
  after_validation :geocode, :if => :full_address_changed?
  
  def self.find_contacts_by_repairer_id(id)
    repairer = self.find(id)
    repairer.contact_repairers.pluck(:email)
  end
end
