class AddDatetimeToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :datetime, :datetime
  end
end
