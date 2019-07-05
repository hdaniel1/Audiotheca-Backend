class Api::V1::UserAlbum < ApplicationRecord
    belongs_to :user
    has_many :playlist_albums, dependent: :destroy
    has_many :playlists, through: :playlist_albums
end
