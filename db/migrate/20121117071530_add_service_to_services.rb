class AddServiceToServices < ActiveRecord::Migration
  def change
    add_column :services, :service, :boolean
  end
end
