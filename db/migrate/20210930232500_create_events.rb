class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.integer :eventID
      t.integer :eventlistID
      t.date :date
      t.string :description
      t.boolean :isMandatory

      t.timestamps
    end

    create_table :event_list do |t|
      t.integer :eventlistID
      t.integer :memberID
    end
  end
end
