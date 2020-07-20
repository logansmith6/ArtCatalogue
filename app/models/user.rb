class User < ApplicationRecord
   has_secure_password
   validates_presence_of :email
   validates_uniqueness_of :email
   validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
   has_many :posts, dependent: :destroy
   has_many :artists, through: :posts
   has_many :likes, through: :posts

   scope :ordered, -> {order('posts_count DESC')}
   # scope :most_posts, ->
   
   
end
