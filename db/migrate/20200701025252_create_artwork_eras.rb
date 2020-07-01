class CreateArtworkEras < ActiveRecord::Migration[6.0]
  def change
    create_table :artwork_eras do |t|
      t.string :name
      t.string :time_period

      t.timestamps
    end
  end
end
