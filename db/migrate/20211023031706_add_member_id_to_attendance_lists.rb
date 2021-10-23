class AddMemberIdToAttendanceLists < ActiveRecord::Migration[6.1]
  def change
    add_column :attendance_lists, :member_id, :integer
  end
end
