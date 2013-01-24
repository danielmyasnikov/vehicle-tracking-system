class AddAttachmentInvoiceToAssets < ActiveRecord::Migration
  def self.up
    change_table :assets do |t|
      t.attachment :invoice
    end
  end

  def self.down
    drop_attached_file :assets, :invoice
  end
end
