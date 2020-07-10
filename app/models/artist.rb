class Artist < ApplicationRecord
    has_many :posts
    has_many :users, through: :posts
    #has_many :museums, through: :posts

    
end
