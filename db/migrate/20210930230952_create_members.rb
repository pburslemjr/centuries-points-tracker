class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.integer :memberID
      t.string :name
      t.string :email

      t.timestamps
    end

    create_table :member_list do |t|
      t.integer :memberID
    end

    create_table :admin_list do |t|
      t.integer :memberID
    end
  end
end
