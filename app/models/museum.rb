class Museum < ApplicationRecord
    has_many :artists, through: :paintings
    has_many :artwork_eras
end
