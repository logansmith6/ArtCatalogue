class CreatePaintings < ActiveRecord::Migration[6.0]
  def change
    create_table :paintings do |t|
      t.string :title
      t.integer :rating
      

      t.timestamps
    end
  end
end
