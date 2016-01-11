class ToAddColumntoJoinPost < ActiveRecord::Migration
  def change
  	remove_column :join_posts, :post_id
  	add_column :join_posts, :post_id, :integer
  		add_column :join_posts, :tag_id, :integer
  end
  
end
