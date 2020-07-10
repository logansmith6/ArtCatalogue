class Museum < ApplicationRecord
    has_many :posts
    has_many :artists, through: :painting_posts
    has_many :artwork_eras
end
