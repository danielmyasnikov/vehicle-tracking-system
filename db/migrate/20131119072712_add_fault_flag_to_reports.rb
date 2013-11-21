class AddFaultFlagToReports < ActiveRecord::Migration
  def change
    add_column :reports, :fault_flag, :boolean
    add_column :reports, :fault_book_id, :integer
    
    Fleet.all.each do |f|
      s = Serviceable.new
      s.service_type_id = 0
      s.fleet_id = f.id
      s.save!
    end
  end
end
