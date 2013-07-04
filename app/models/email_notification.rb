class EmailNotification < ActiveRecord::Base
  attr_accessible :notification_id, :setting_id, :primary, :secondary, :notification, :interval
  belongs_to :notification
  belongs_to :setting
end