class Log < ActiveRecord::Base
  attr_accessible :line, :name, :status
  has_many :lines
end
