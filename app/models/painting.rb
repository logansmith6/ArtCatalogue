class Painting < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    belongs_to :artist
    belongs_to :museum
    belongs_to :artwork_era


   

    def artist_name=(name)
        self.artist = Artist.find_or_create_by(name: name)
    end

    def artist_name 
        artist.try(:name)
    end

end
