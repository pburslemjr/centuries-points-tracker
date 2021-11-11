class AddMissingTables < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :email_id
      t.string :name
      t.timestamps
    end

    create_table :service_hours do |t|
      t.integer :member_id
      t.date :date
      t.integer :approval_list_id
      t.string :description
      t.integer :hours
      t.timestamps
    end

    create_table :events do |t|
      t.date :date
      t.string :description
      t.boolean :isMandatory
      t.string :location
      t.integer :admin_id
      t.timestamps
    end
  end
end
