class CreateContactRepairers < ActiveRecord::Migration
  def change
    create_table :contact_repairers do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.integer :repairer_id

      t.timestamps
    end
  end
end
