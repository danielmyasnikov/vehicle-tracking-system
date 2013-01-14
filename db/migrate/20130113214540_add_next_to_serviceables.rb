class AddNextToServiceables < ActiveRecord::Migration
  def change
    add_column :serviceables, :next_service_date, :date
  end
end
