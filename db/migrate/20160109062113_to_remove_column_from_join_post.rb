class ToRemoveColumnFromJoinPost < ActiveRecord::Migration
  def change
  	remove_column :join_posts, :tag_id
  end
end
