class ContactRepairer < ActiveRecord::Base
  attr_accessible :email, :name, :phone, :repairer_id, :contact_repairers_attributes
  belongs_to :repairer
end
