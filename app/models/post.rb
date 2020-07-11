class Post < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    belongs_to :artist
    accepts_nested_attributes_for :artist
    #belongs_to :museum
    #belongs_to :artwork_era
    #has_many :comments


     
   

    
end
