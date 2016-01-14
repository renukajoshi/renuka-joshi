class AddFieldsToUsers < ActiveRecord::Migration
  def change


  	add_column :users , :first_name , :string
  	add_column :users , :last_name , :string
  	add_column :users , :birthdate , :date
  	add_column :users , :post_id , :integer
  	add_column :users , :gender , :string
  	add_column :users , :country , :string
   
   end
end
