class CreateApi1Playlists < ActiveRecord::Migration[5.2]
  def change
    create_table :playlists do |t|
      t.string :name
      t.string :image
      t.integer :user_id
      t.string :description
      t.string :spotify_id

      t.timestamps
    end
  end
end
