class ContactRepairer < ActiveRecord::Base
  attr_accessible :email, :name, :phone, :repairer_id
  belongs_to :repairer
end
