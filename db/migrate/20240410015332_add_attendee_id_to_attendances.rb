class AddAttendeeIdToAttendances < ActiveRecord::Migration[7.1]
  def change
    add_column :attendances, :attendee_id, :integer
  end
end
