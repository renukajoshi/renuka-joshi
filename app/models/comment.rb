class Comment < ActiveRecord::Base
	#has_many :post
	has_one :user
	belongs_to :post 

	validates_presence_of :comment
end
