class AddPeriodAndTimesToDriver < ActiveRecord::Migration
  def change
    add_column :drivers, :training_period, :string
    add_column :drivers, :training_frequency, :integer
  end
end
