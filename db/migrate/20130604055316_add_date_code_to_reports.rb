class AddDateCodeToReports < ActiveRecord::Migration
  def change
    add_column :reports, :datecode, :string
  end
end
