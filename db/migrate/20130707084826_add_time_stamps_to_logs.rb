class AddTimeStampsToLogs < ActiveRecord::Migration
  def change
    add_column :logs, :start_timestamp, :datetime
    add_column :logs, :final_timestamp, :datetime
  end
end
