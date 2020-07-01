class Artist < ApplicationRecord
    has_many :museums, through: :paintings
end
