class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :Tag
      t.references :post

      t.timestamps
    end
    #add_foreign_key :tag_id
  end
end
