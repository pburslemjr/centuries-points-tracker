class AddLoIsLockedToEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :isLocked, :string
    add_column :events, :isLocked, :boolean
  end
end
