class Api::V1::PlaylistAlbum < ApplicationRecord
    belongs_to :playlist 
    belongs_to :user_album
end
