class CreateWhitelist < ActiveRecord::Migration[6.1]
  def change
    create_table :whitelists do |t|
      t.string :email, null: false
      t.boolean :isAdmin
      t.timestamps
    end
  end
end
