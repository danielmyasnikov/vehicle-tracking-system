class AddServiceDateToFleets < ActiveRecord::Migration
  def change
    add_column :fleets, :last_service_date, :date
    add_column :fleets, :next_service_date, :date
  end
end
