class AddTimeToServices < ActiveRecord::Migration
  def change
    add_column :services, :start_service_time, :time
    add_column :services, :finish_service_time, :time
  end
end
