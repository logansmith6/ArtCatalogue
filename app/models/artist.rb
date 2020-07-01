class Artist < ApplicationRecord
    has_many :museums, through: :artwork
end
