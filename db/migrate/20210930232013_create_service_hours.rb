class CreateServiceHours < ActiveRecord::Migration[6.1]
  def change
    create_table :service_hours do |t|
      t.integer :servicehoursID
      t.integer :servicehourlistID
      t.date :date
      t.float :hours
      t.string :description
      t.boolean :isApproved

      t.timestamps
    end

    create_table :service_hour_list do |t|
      t.integer :servicehourlistID
      t.integer :memberID
    end
  end
end
