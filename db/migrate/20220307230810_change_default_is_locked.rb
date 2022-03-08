class ChangeDefaultIsLocked < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :isLocked, :boolean
    add_column :events, :isLocked, :boolean, default: false
  end
end
