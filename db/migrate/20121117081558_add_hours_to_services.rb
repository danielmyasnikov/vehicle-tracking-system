class AddHoursToServices < ActiveRecord::Migration
  def change
    add_column :services, :hours, :integer
  end
end
