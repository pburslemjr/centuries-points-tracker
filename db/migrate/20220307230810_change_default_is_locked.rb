class ChangeDefaultIsLocked < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :isLocked, :boolean, default: false
  end
end
