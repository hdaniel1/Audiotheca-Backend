class Api::V1::PlaylistSerializer < ActiveModel::Serializer
  attributes :id, :name, :playlist_image, :description
  belongs_to :user
  has_many :playlist_albums
  has_many :user_albums, through: :playlist_albums
end
