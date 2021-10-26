class CreateApprovedHours < ActiveRecord::Migration[6.1]
  def change
    create_table :approved_hours do |t|
      t.integer :service_hour_id
      t.integer :admin_id
      t.date :date_approved
      t.timestamps
    end
  end
end
