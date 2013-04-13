class AddArchivedToServices < ActiveRecord::Migration
  def change
    add_column :services, :archived, :boolean
    Service.update_all(:archived => false)
  end
end
