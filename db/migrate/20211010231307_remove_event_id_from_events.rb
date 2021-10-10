class RemoveEventIdFromEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :eventID, :integer
  end
end
