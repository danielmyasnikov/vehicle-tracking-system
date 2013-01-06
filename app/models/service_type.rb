class ServiceType < ActiveRecord::Base
  attr_accessible :name
  validates_uniqueness_of :name
  has_many :fleets, :through => :serviceables
  has_many :serviceables
end
