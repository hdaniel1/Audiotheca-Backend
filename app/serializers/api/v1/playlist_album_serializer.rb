class Api::V1::PlaylistAlbumSerializer < ActiveModel::Serializer
  attributes :id, :playlist_id, :user_album_id
  belongs_to :playlist
  belongs_to :user_album
end
