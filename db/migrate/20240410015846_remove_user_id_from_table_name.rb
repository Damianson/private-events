class RemoveUserIdFromTableName < ActiveRecord::Migration[7.1]
  def change
    remove_column :attendances, :user_id, :integer
  end
end
