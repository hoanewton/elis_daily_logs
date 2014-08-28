class CreateBabies < ActiveRecord::Migration
  def change
    create_table :babies do |t|
    	t.string :first_name
    	t.string :last_name
    	t.string :gender
    	t.integer :age
    	t.string :parent_name
    	t.text 	:parent_contact
    	t.string :special_condition

    	t.timestamps

    end
  end
end
