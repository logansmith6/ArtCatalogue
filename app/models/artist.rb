class Artist < ApplicationRecord
    has_many :posts
    has_many :users, through: :posts
    validates_presence_of :name
   
   

    
end
