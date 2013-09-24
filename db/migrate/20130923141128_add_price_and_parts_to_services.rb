class AddPriceAndPartsToServices < ActiveRecord::Migration
  def change
    add_column :services, :parts, :string
    add_column :services, :services, :string
  end
end
