class AddBookedToServiceables < ActiveRecord::Migration
  def change
    add_column :serviceables, :booked, :boolean
  end
end
Serviceable.update_all(:booked => false)