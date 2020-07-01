class Painting < ApplicationRecord
    has_one_attached :image
    belongs_to :artist
    belogns_to :museum
end
