class CreateApiV1PlaylistAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :api_v1_playlist_albums do |t|
      t.integer :useralbum_id
      t.integer :playlist_id

      t.timestamps
    end
  end
end
