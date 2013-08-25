class ApplicationSetting < ActiveRecord::Base
  attr_accessible :name, :trigger, :value
end
