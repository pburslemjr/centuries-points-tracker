class RemoveApprovedHours < ActiveRecord::Migration[6.1]
  def change
    drop_table :approved_hours
  end
end
