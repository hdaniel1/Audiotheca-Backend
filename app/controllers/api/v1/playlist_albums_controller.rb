class Api::V1::PlaylistAlbumsController < ApplicationController
    
    def index 
        #get all the playlist albums for the logged in user
        render json:(Api::V1::PlaylistAlbum.all.joins(:playlist).where(playlists:{user_id: params[:user]}))
    end

    def create 
        #first check if a playlist album for the given playlist / spotify album exists
        if Api::V1::PlaylistAlbum.find_by(playlist_id: playlist_album_params[:playlist_id], spotify_id: playlist_album_params[:spotify_id])
            render json: {error: "playlist album already exists"}, status: 401
        else 
            #check if a userAlbum record exists with the spotify_id, create if false
            @userAlbum = Api::V1::UserAlbum.find_or_create_by(spotify_id: params[:spotify_id],
                                                            user_id: params[:user_id])
            #create the playlistAlbum for the playlist and the userAlbum above
            @playlistAlbum = Api::V1::PlaylistAlbum.find_or_create_by(playlist_id: playlist_album_params[:playlist_id], 
                                                                    user_album_id: @userAlbum.id, 
                                                                    spotify_id: playlist_album_params[:spotify_id])

            if @playlistAlbum.save
                render json: {user_album: Api::V1::UserAlbumSerializer.new(@userAlbum), playlist_album: Api::V1::PlaylistAlbumSerializer.new(@playlistAlbum), status: :created}
            else 
                render json: {error: 'failed to create playlist album'}, status: 403
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
