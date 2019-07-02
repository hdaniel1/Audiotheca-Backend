class CreateApiV1PlaylistAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :playlist_albums do |t|
      t.integer :user_album_id
      t.integer :playlist_id

      t.timestamps
    end
  end
end
