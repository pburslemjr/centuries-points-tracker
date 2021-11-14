class RemoveAdminFromWhitelist < ActiveRecord::Migration[6.1]
  def change
    remove_column :whitelists, :isAdmin
  end
end
