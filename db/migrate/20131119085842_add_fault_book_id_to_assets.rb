class AddFaultBookIdToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :fault_book_id, :integer
  end
end
