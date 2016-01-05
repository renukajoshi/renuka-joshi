class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  

         has_many :posts

         devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         

      #attr_accessible :email, :password, :password_confirmation, :remember_me
end
