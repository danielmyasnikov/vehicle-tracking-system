class AddOtherToFleets < ActiveRecord::Migration
  def change
    add_column :fleets, :other, :text
  end
end
