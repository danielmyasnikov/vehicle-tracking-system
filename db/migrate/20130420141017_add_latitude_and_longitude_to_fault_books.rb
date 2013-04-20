class AddLatitudeAndLongitudeToFaultBooks < ActiveRecord::Migration
  def change
    add_column :fault_books, :latitude, :float
    add_column :fault_books, :longitude, :float
  end
end
