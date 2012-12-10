class AddAddressToRepairers < ActiveRecord::Migration
  def change
    add_column :repairers, :full_address, :string
  end
end
