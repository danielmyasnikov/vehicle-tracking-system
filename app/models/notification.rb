class Notification < ActiveRecord::Base
  attr_accessible :name, :primary, :secondary
  
  has_many :settings, :through => :email_notifications
  has_many :email_notifications
end
