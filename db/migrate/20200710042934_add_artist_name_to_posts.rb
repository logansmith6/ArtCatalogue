class AddArtistNameToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :artist_name, :string
  end
end
