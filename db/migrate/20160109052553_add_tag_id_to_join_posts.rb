class AddTagIdToJoinPosts < ActiveRecord::Migration
  def change
    add_column :join_posts, :tag_id, :integer
  end
end
