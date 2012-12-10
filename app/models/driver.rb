class Driver < ActiveRecord::Base
  attr_accessible :dl_expiry, :dl_number, :name, :phone_no, :pic, :training_documents, :training_schedule, :fleet_id
  
  belongs_to :fleet
  
  MAX_DUE_DATE = 3.days.since(Time.now).to_date
  MIN_DUE_DATE = Date.today
  
  def self.expired_licenses
    where("dl_expiry < ?", MIN_DUE_DATE)
    
  end
  
  def self.license_due
    where("dl_expiry < ? and dl_expiry > ?", MAX_DUE_DATE, MIN_DUE_DATE)
  end
end
