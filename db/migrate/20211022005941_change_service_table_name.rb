class ChangeServiceTableName < ActiveRecord::Migration[6.1]
  def change
    rename_table :service_hours, :services
  end
end
