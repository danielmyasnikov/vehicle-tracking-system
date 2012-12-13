class AddSortToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :sort, :string
  end
end
