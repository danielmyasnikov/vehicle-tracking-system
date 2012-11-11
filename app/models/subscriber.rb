class Subscriber < ActiveRecord::Base
  attr_accessible :stop_this_email, :subscribtion_id, :unsubscribe, :user_id
  
  belongs_to :user
  belongs_to :subscribtion
end
