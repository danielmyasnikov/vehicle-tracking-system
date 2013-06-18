class AddStartDayToServiceables < ActiveRecord::Migration
  def change
    add_column :serviceables, :start_date, :date
  end
end
