class AddBookedToServiceables < ActiveRecord::Migration
  def change
    add_column :serviceables, :booked, :boolean
    Serviceable.update_all(:booked => false)
  end
end
