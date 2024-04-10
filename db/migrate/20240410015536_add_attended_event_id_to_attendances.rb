class AddAttendedEventIdToAttendances < ActiveRecord::Migration[7.1]
  def change
    add_column :attendances, :attended_event_id, :integer
  end
end
