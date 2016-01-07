class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :post_id
      t.timestamps
    end
   add_reference :posts, :category, index: true , foreign_key: true
  end
end
