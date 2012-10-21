class AddDateAndTimeToServices < ActiveRecord::Migration
  def change
    add_column :services, :start_service_date, :date
    add_column :services, :finish_service_date, :date
  end
end
