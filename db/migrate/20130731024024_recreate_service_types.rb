class RecreateServiceTypes < ActiveRecord::Migration
  def change
    Fleet.all.each do |f|
    	f.serviceables.each do |fs|
    	  fs.destroy
    	end
    end
    Fleet.all.each do |f|
    	ServiceType.all.each do |st|
    	  f.serviceables << Serviceable.new(:service_type_id => st.id)
      end
    end
  end
end
