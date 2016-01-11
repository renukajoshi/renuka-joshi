class AddPostIdToJoinPosts < ActiveRecord::Migration
  def change
    add_column :join_posts, :post_id, :integer
  end
end
