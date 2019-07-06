class Api::V1::UserAlbumsController < ApplicationController

    def index 
        render json:(Api::V1::UserAlbum.all.where(user_id: params[:user]))
    end

    def update 
            @userAlbum = Api::V1::UserAlbum.find(user_album_params[:id])
            @userAlbum.update(listened_to: user_album_params[:listened_to], date_listened_to: DateTime.now, rating: user_album_params[:rating])
            #delete all playlist albums for the userAlbum listened to 
            Api::V1::PlaylistAlbum.where(spotify_id: params[:spotify_id]).destroy_all
            render json: @userAlbum
    end 

    def destroy
        render json: Api::V1::UserAlbum.find(params[:id]).destroy
    end

    private 

    def user_album_params 
        params.require(:user_album).permit(:id, :listened_to, :user_id, :review, :date_listened_to, :rating, :spotify_id)
    end 
end
