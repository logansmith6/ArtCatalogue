class Post < ApplicationRecord
    belongs_to :user
    has_many :artists, through: :artwork_era
    has_many :artworks, through: :artwork_era
end
