class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :description
      t.text :comment
      t.references :day, index: true

      t.timestamps
    end
  end
end
