class RemoveRedundantPk < ActiveRecord::Migration[6.1]
  def change
    remove_column :event_list, :eventlistID, :integer
    remove_column :members, :memberID, :integer
    remove_column :service_hour_list, :servicehourlistID, :integer
    remove_column :service_hours, :servicehoursID, :integer
  end
end
