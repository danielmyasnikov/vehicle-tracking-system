class Repairer < ActiveRecord::Base
  acts_as_gmappable
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
  
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
  def gmaps4rails_address
    "#{self.suburb}, #{self.state}, #{self.postcode}" 
  end
  def gmaps4rails_infowindow
    "<h4>#{business_name}</h4>"
  end

end
