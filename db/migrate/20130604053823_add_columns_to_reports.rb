class AddColumnsToReports < ActiveRecord::Migration
  def change
    add_column :reports, :name, :string
    add_column :reports, :make, :string
    add_column :reports, :model, :string
    add_column :reports, :service_date, :datetime
  end
end
