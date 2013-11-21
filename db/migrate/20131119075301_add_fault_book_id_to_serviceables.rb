class AddFaultBookIdToServiceables < ActiveRecord::Migration
  def change
    add_column :services, :fault_book_id, :integer
  end
end
