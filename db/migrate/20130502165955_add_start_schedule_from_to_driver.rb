class AddStartScheduleFromToDriver < ActiveRecord::Migration
  def change
    add_column :drivers, :start_schedule_from, :date
  end
end
