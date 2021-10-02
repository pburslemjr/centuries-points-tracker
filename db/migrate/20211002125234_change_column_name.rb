class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :service_log_hours, :desctiption, :description_service
  end
end
