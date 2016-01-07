class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
     
      t.string :Title
      t.string :tag
      t.text :Description
      

      t.timestamps
    end
    #add_foreign_key :p_id
    #add_foreign_key :post_id
    add_reference :users, :post, index: true,  foreign_key: true
  end
end
