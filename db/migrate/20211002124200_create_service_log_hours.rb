class CreateServiceLogHours < ActiveRecord::Migration[6.1]
  def change
    create_table :service_log_hours do |t|
      t.float :hours
      t.date :date
      t.string :activity
      t.string :desctiption

      t.timestamps
    end
  end
end
