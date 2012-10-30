class Training < ActiveRecord::Base
  attr_accessible :date, :driver_id, :finish_time, :name, :start_time
end
