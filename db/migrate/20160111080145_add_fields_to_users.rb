class AddFieldsToUsers < ActiveRecord::Migration
  def change
  	remove_column :users , :first_name ,:string
  	remove_column :users , :last_name ,:string
  	remove_column :users , :Birthdate ,:date

  	add_column :users , :first_name , :string
  	add_column :users , :last_name , :string
  	add_column :users , :birthdate , :date
  	add_column :users , :post_id , :integer

   end
end
