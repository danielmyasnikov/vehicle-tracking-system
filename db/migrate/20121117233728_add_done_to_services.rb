class AddDoneToServices < ActiveRecord::Migration
  def change
    add_column :services, :service_done, :boolean
    add_column :services, :repair_done, :boolean
    add_column :services, :warranty_done, :boolean
    add_column :services, :damage_done, :boolean
    add_column :services, :breakdown_done, :boolean
  end
end
