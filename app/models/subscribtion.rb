class Subscribtion < ActiveRecord::Base
  attr_accessible :name
  
  has_many :subscribtions, through: :subscribers
  has_many :subscribers
end
