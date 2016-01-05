class Tag < ActiveRecord::Base
	has_and_belongs_to_many :posts ,:foreign_key => "post_id", :counter_cache => true

	delegate :Tag, to: :post, allow_nil: true, prefix: true
	
end
