class CreateNaps < ActiveRecord::Migration
  def change
    create_table :naps do |t|
    	t.datetime :start_time
    	t.datetime :end_time
    	t.text 		 :discription
    	t.belongs_to :day

    	t.timestamps
    end
  end
end
