class Driver < ActiveRecord::Base
  attr_accessible :dl_expiry, :dl_number, :name, :phone_no, :pic, :training_documents, :training_schedule, :fleet_id
  
  belongs_to :fleet
end
