class ChangeLineToText < ActiveRecord::Migration
  def change
    change_column :logs, :line, :text
  end
end
