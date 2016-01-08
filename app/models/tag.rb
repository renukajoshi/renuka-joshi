class Tag < ActiveRecord::Base
	has_many :JoinPosts
	has_many :posts , through: :JoinPosts 
end
