class Api::V1::PlaylistsController < ApplicationController

    def index 
        render json: (Api::V1::Playlist.all.where(user_id: params[:user]))
    end

    def create 
        render json: Api::V1::Playlist.find_or_create_by(playlist_params)
    end 

    def show 
        render json: Api::V1::Playlist.find(params[:id])
    end 

    private 

    def playlist_params
        params.require(:playlist).permit(:id, :user_id, :name, :description, :image)
    end 

end
