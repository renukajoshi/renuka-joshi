class Post < ActiveRecord::Base
	cattr_accessor :current_user



	has_many :comments
	has_many :tags
	belongs_to :user , :foreign_key => "post_id"
	has_many :categories

	 #belong_to :category

	validates_presence_of :Title , :Description
end
