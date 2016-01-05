class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.integer :p_id, index:true
      t.text :comment
      
     

      

      t.timestamps
    end
    	#	add_foreign_key :p_id
  end
end
