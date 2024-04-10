class RemoveEventIdFromTableName < ActiveRecord::Migration[7.1]
  def change
    remove_column :attendances, :event_id, :integer
  end
end
