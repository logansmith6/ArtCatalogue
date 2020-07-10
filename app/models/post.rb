class Post < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    belongs_to :artist
    #belongs_to :museum
    #belongs_to :artwork_era
    #has_many :comments


    private 

    def artist_name
        @artist = Artist.find_or_create_by(name: params[:artist_name])
    end


   

    
end
