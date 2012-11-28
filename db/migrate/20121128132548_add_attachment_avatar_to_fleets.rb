class AddAttachmentAvatarToFleets < ActiveRecord::Migration
  def change
    add_attachment :fleets, :avatar
  end
end
