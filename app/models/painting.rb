class Painting < ApplicationRecord
    has_one_attached :image
    belogns_to :user
    #belongs_to :artist
    #belongs_to :museum
end
