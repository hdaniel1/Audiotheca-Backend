class Api::V1::Playlist < ApplicationRecord
    validates :name, presence: true
    belongs_to :user
    has_many :playlist_albums, :dependent => :destroy
    has_many :user_albums, through: :playlist_albums
    # mount_uploader :playlist_image, PlaylistImageUploader
    # has_one_attached :image
end
