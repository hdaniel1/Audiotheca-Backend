class Api::V1::UserAlbumsController < ApplicationController

    def index 
        render json:(Api::V1::UserAlbum.all.where(user_id: params[:user]))
    end

    def update 
        if user_album_params[:listened_to] == false
            @userAlbum = Api::V1::UserAlbum.find(user_album_params[:id])
            @userAlbum.update(listened_to: user_album_params[:listened_to], date_listened_to: DateTime.now)
            #delete all playlist albums for the userAlbum listened to 
            Api::V1::PlaylistAlbum.where(spotify_id: params[:spotify_id]).destroy_all
            render json: @userAlbum
        else 
            @userAlbum = Api::V1::UserAlbum.find(user_album_params[:id])
            @userAlbum.update(rating: user_album_params[:rating])
            render json: @userAlbum
        end 
    end 

    def destroy
        render json: Api::V1::UserAlbum.find(params[:id]).destroy
    end

    private 

    def user_album_params 
        params.require(:user_album).permit(:id, :listened_to, :user_id, :review, :date_listened_to, :rating, :spotify_id)
    end 
end
