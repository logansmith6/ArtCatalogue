class Post < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    belongs_to :artist
    #belongs_to :museum
    #belongs_to :artwork_era
    #has_many :comments


     
   

    
end
