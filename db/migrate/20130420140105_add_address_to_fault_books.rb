class AddAddressToFaultBooks < ActiveRecord::Migration
  def change
    add_column :fault_books, :address, :string
  end
end