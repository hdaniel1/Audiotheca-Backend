class Api::V1::UserAlbumSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :rating, :review, :listened_to, :date_listened_to, :spotify_id
  has_many :playlist_albums
  has_many :playlists, through: :playlist_albums
end
