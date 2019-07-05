class Api::V1::UserAlbumsController < ApplicationController

    def index 
        render json:(Api::V1::UserAlbum.all.where(user_id: params[:user]))
    end

    def update 
        @userAlbum = Api::V1::UserAlbum.find(params[:id])
        @userAlbum.update(user_album_params)
        render json: @userAlbum
    end 

    def destroy
        render json: Api::V1::UserAlbum.find(params[:id]).destroy
    end

    private 

    def user_album_params 
        params.require(:user_album).permit()
    end 
end
