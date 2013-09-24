class AddServicesAndPartsToReports < ActiveRecord::Migration
  def change
    add_column :reports, :services, :float
    add_column :reports, :parts, :float
  end
end
