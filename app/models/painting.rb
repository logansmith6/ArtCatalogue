class Painting < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    belongs_to :artist
    belongs_to :museum
    belongs_to :artwork_era


    accepts_nested_attributes_for :artist

    def artist_name=(name)
        self.artist = Artist.find_or_create_by(name: name)
    end
end
