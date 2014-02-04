class AddMilageSinceLastServiceToFleets < ActiveRecord::Migration
  def change
    add_column :fleets, :milage_since_last_service, :integer
    
    Fleet.all.each do |f|
      f.update_column(:milage_since_last_service, 0)
      f.save!
    end
  end
end
