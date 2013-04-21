class AddCanceledToFaultBook < ActiveRecord::Migration
  def change
    add_column :fault_books, :canceled, :boolean
  end
end
