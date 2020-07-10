class Artist < ApplicationRecord
    has_many :posts
    has_many :museums, through: :posts

    
end
