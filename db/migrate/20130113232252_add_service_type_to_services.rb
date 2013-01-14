class AddServiceTypeToServices < ActiveRecord::Migration
  def change
    add_column :services, :service_type_name, :string
  end
end
