class AddAttachmentInvoiceToFleets < ActiveRecord::Migration
  def self.up
    change_table :fleets do |t|
      t.attachment :invoice
    end
  end

  def self.down
    drop_attached_file :fleets, :invoice
  end
end
