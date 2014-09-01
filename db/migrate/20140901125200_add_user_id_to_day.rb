class AddUserIdToDay < ActiveRecord::Migration
  def change
    add_column :days, :user_id, :integer, references: :users
    # add_index :days, :user_id
  end
end
