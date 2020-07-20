class Post < ApplicationRecord
    validates_presence_of :title
    validates_presence_of :image
    has_one_attached :image
    belongs_to :user
    belongs_to :artist
    accepts_nested_attributes_for :artist, reject_if: :all_blank
    accepts_nested_attributes_for :user
    has_many :likes, dependent: :destroy

    scope :most_posts, -> {order('posts DESC')}
    scope :order_by_post_count, -> {order("posts DESC")}
    
    

     
   

    
end
