class AttendanceList < ApplicationRecord
  belongs_to :event, :class_name => 'Event', :foreign_key => 'event_id'
  has_many :members
end
