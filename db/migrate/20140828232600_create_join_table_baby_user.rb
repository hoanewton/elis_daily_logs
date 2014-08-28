class CreateJoinTableBabyUser < ActiveRecord::Migration
  def change
    create_join_table :babies, :users do |t|
      # t.index [:baby_id, :user_id]
      # t.index [:user_id, :baby_id]
    end
  end
end
