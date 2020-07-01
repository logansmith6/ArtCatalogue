class Museum < ApplicationRecord
    has_many :artists, through: :artwork
    has_many :artwork_eras
end
