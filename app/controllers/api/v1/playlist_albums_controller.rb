class Api::V1::PlaylistAlbumsController < ApplicationController
    
    def index 
        #get all the playlist albums for the logged in user
        render json:(Api::V1::PlaylistAlbum.all.joins(:playlist).where(playlists:{user_id: params[:user]}))
    end

    def create 
        #first check if a playlist album for the given playlist / spotify album exists
        if Api::V1::PlaylistAlbum.find_by(playlist_id: playlist_album_params[:playlist_id], spotify_id: playlist_album_params[:spotify_id])
            render json: {error: "playlist album already exists"}, status: 422
        else 
            #check if a user album already exists with that spotify id / user id. If true, return just the playlist album json, otherwise create and return both playlist and useralbum json
            if Api::V1::UserAlbum.find_by(spotify_id: params[:spotify_id], user_id: params[:user_id])
                existingUserAlbum = Api::V1::UserAlbum.find_by(spotify_id: params[:spotify_id], user_id: params[:user_id])
                @playlistAlbum = Api::V1::PlaylistAlbum.create(playlist_id: playlist_album_params[:playlist_id], user_album_id: existingUserAlbum.id, spotify_id: playlist_album_params[:spotify_id])
        
                if @playlistAlbum.save 
                    render json: {playlist_album: Api::V1::PlaylistAlbumSerializer.new(@playlistAlbum), spotify_info: params[:spotify_info]}, status: 200
                else 
                    render json: {error: 'failed to create playlist album'}, status: 400
                end

            else 
                @userAlbum = Api::V1::UserAlbum.create(spotify_id: params[:spotify_id], user_id: params[:user_id])
                @playlistAlbum = Api::V1::PlaylistAlbum.create(playlist_id: playlist_album_params[:playlist_id], user_album_id: @userAlbum.id, spotify_id: playlist_album_params[:spotify_id])

                if @playlistAlbum.save 
                    render json: {playlist_album: Api::V1::PlaylistAlbumSerializer.new(@playlistAlbum), user_album: Api::V1::UserAlbumSerializer.new(@userAlbum), spotify_info: params[:spotify_info]}, status: 200
                else 
                    render json: {error: 'failed to create playlist album'}, status: 400
                end
            end
        end  
    end

    def destroy
        render json: Api::V1::PlaylistAlbum.find(params[:id]).destroy
    end

    private 

    def playlist_album_params 
        params.require(:playlist_album).permit(:id, :useralbum_id, :spotify_id, :playlist_id)
    end 
    
end
