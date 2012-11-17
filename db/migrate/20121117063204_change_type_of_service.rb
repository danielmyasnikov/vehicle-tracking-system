class ChangeTypeOfService < ActiveRecord::Migration
  def up
    remove_column :services, :warranty
    add_column :services, :warranty, :boolean
    remove_column :services, :damage
    add_column :services, :damage, :boolean
    remove_column :services, :repair
    add_column :services, :repair, :boolean
    add_column :services, :breakdown, :boolean
    add_column :services, :other, :text
    add_column :services, :service_price, :float
    add_column :services, :repair_price, :float
    add_column :services, :warranty_price, :float
    add_column :services, :damage_price, :float
    add_column :services, :breakdown_price, :float
  end

  def down
    change_column :services, :warranty, :string
    change_column :services, :damage, :text
    change_column :services, :repair, :string
    remove_column :services, :breakdown, :boolean
    remove_column :services, :other, :text
    remove_column :services, :service_price, :float
    remove_column :services, :repair_price, :float
    remove_column :services, :warranty_price, :float
    remove_column :services, :damage_price, :float
    remove_column :services, :breakdown_price, :float
  end
end
