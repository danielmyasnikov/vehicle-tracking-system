class AddCheckerToServices < ActiveRecord::Migration
  def change
    add_column :services, :finalise, :boolean
  end
end
