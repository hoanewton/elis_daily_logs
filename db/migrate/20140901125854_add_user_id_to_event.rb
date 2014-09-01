class AddUserIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :user_id, :integer, references: :users
  end
end
