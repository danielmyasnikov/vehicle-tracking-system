class Line < ActiveRecord::Base
  belongs_to :logs
  attr_accessible :item, :item_type, :line
end
