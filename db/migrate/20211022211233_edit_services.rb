class EditServices < ActiveRecord::Migration[6.1]
  def change
    remove_column :services, :approval_list_id
    add_column :services, :isApproved, :boolean
  end
end
