class User < ApplicationRecord
   has_secure_password
   validates_presence_of :email
   validates_uniqueness_of :email
   validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 

   has_many :posts
   has_many :artists, through: :posts
   #has_many :comments

   private

   def most_posts
      user = User.all.max_by {|user| user.posts.count}
      
   end 
end
