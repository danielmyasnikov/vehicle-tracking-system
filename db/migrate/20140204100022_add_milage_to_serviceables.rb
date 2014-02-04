class AddMilageToServiceables < ActiveRecord::Migration
  def change

    add_column :serviceables, :milage_since_last_service, :integer
    
    Serviceable.all.each do |f|
      f.update_column(:milage_since_last_service, 0)
      f.save!
    end
  end
end
