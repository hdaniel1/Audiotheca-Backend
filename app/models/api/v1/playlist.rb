class Api::V1::Playlist < ApplicationRecord
    belongs_to :user
    has_many :playlist_albums
    has_many :user_albums, through: :playlist_albums
end
