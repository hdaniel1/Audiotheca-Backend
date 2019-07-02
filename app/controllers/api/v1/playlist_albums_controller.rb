class Api::V1::PlaylistAlbumsController < ApplicationController
    
    def index 
        #get all the playlist albums for the logged in user
        render json:(Api::V1::PlaylistAlbum.all.joins(:playlist).where(playlists:{user_id: 122172731}))
    end

    def create 
        #check if a userAlbum record exists with the spotify_id, create if false
        @userAlbum = Api::V1::UserAlbum.find_or_create_by(spotify_id: params[:spotify_id], user_id: params[:user_id])
        #create the playlistAlbum for the playlist and the userAlbum above
        @playlistAlbum = Api::V1::PlaylistAlbum.find_or_create_by(playlist_id: playlist_album_params[:playlist_id], user_album_id: @userAlbum.id)

        if @playlistAlbum.save
            render json: @playlistAlbum, status: :created
        else 
            render json: { error: 'failed to create playlist album' }, status: :not_acceptable
        end     
    end

    def destroy
        render json: Api::V1::PlaylistAlbum.find(params[:id]).destroy
    end

    private 

    def playlist_album_params 
        params.require(:playlist_album).permit(:id, :useralbum_id, :playlist_id)
    end 
    
end
