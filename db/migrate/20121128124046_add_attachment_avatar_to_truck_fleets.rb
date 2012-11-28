class AddAttachmentAvatarToTruckFleets < ActiveRecord::Migration
  def change
    add_attachment :truck_fleets, :avatar
  end
end
