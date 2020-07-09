class AddUserIdToPaintings < ActiveRecord::Migration[6.0]
  def change
    add_column :paintings, :user_id, :integer
  end
end
