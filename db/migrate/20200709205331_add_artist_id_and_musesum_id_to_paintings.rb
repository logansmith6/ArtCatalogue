class AddArtistIdAndMusesumIdToPaintings < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :artist_id, :integer
    add_column :posts, :museum_id, :integer
  end
end
