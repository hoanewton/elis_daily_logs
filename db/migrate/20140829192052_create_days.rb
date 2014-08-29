class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.datetime :date
      t.string :title
      t.string :status
      t.text :note
      t.belongs_to :baby

      t.timestamps
    end
  end
end
