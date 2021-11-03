class EditMembers < ActiveRecord::Migration[6.1]
  def change
    rename_column :members, :email_id, :uid
    add_column :members, :isAdmin, :boolean
    add_column :members, :email, :string
  end
end
