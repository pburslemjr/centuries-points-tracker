class AddAttendanceListIdToMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :attendance_list_id, :integer
  end
end
