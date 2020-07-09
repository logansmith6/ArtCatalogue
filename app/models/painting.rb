class Painting < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    belongs_to :artist
    belongs_to :museum

    accepts_nested_attributes_for :artist
end
