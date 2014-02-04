class Asset < ActiveRecord::Base
  attr_accessible :invoice
  belongs_to :fleet
  belongs_to :fault_book
  has_attached_file :invoice,
                  :url  => "/assets/asset/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/asset/:id/:style/:basename.:extension"
  validates_attachment_presence :invoice
  validates_attachment_size :invoice, :less_than => 5.megabytes
end
