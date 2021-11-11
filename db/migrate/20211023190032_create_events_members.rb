class CreateEventsMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :events_members, id: false do |t|
      t.belongs_to :member
      t.belongs_to :event
    end
  end
end
