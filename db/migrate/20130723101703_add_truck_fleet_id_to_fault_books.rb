class AddTruckFleetIdToFaultBooks < ActiveRecord::Migration
  def change
    add_column :fault_books, :truck_fleet_id, :integer
    TruckFleet.all.each do |tf|
      tf.fleets.each do |f|
        f.fault_books.each do |fb|
          fb.truck_fleet_id = tf.id
          fb.save!
        end
      end
    end
  end
end


