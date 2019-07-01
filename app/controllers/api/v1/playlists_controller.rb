class Api::V1::PlaylistsController < ApplicationController

    def index 
        render json: (Api::V1::Playlist.all.where(user_id: params[:user]))
    end

    def create 
        @playlist = Api::V1::Playlist.find_or_create_by(playlist_params)
        if @playlist.save
            render json: @playlist, status: :created
        end
    end 

    def show 
        render json: Api::V1::Playlist.find(params[:id])
    end 

    def update 
        @playlist = Api::V1::Playlist.find(params[:id])
        @playlist.update(playlist_params)
        render json: @playlist
    end 
    
    def destroy
        render json: Api::V1::Playlist.find(params[:id]).destroy
    end

    private 

    def playlist_params
        params.require(:playlist).permit(:id, :user_id, :name, :description, :playlist_image)
    end 

end
