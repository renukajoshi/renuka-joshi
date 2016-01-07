class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         has_many :posts


         #attr_accessible :email, :password, :password_confirmation
  		has_secure_password
  		validates_presence_of :password, :on => :create
  		before_create { generate_token(:auth_token) }
  
  		def generate_token(column)
    		begin
      		self[column] = SecureRandom.urlsafe_base64
    		end while User.exists?(column => self[column])
  		end
end
