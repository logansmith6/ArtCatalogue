class AddArtistIdAndMusesumIdToPaintings < ActiveRecord::Migration[6.0]
  def change
    add_column :paintings, :artist_id, :integer
    add_column :paintings, :museum_id, :integer
  end
end
