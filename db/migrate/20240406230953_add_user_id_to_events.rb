class AddUserIdToEvents < ActiveRecord::Migration[7.1]
  def change
    add_reference :events, :user, null: false, foreign_key: true, default: 2
  end
end
