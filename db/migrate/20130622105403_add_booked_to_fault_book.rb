class AddBookedToFaultBook < ActiveRecord::Migration
  def change
    add_column :fault_books, :booked, :boolean
    FaultBook.update_all(:booked => false)
  end
end
