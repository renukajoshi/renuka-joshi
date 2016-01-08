class Post < ActiveRecord::Base
	cattr_accessor :current_user

	has_many :comments ,:dependent => :destroy

	belongs_to :user , :foreign_key => "post_id"
	# has_many :categories , :dependent => :destroy

	 belongs_to :category , :foreign_key =>"category_id"

	has_many :JoinPosts
	has_many :tags , through: :JoinPosts

	validates_presence_of :Title , :Description
end
