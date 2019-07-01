class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :playlists, :image, :playlist_image
  end
end
