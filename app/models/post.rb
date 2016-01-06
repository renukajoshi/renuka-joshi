class Post < ActiveRecord::Base
	cattr_accessor :current_user



	has_many :comments ,:dependent => :destroy
	has_many :tags , :dependent => :destroy
	belongs_to :user , :foreign_key => "post_id"
	belongs_to :category, :foreign_key => "category_id"

	 #belong_to :category

	validates_presence_of :Title , :Description
end
