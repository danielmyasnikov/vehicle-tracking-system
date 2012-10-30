class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.string :name
      t.date :date
      t.time :start_time
      t.time :finish_time
      t.integer :driver_id

      t.timestamps
    end
  end
end
