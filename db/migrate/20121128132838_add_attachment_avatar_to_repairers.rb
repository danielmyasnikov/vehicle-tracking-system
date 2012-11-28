class AddAttachmentAvatarToRepairers < ActiveRecord::Migration
  def change
    add_attachment :repairers, :avatar
  end
end
