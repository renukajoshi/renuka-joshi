class AddPostIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :posst_id, :integer

    add_reference :posts, :user, index: true,  foreign_key: true
  end
end
