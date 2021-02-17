class PlaylistsController < ApplicationController
    skip_before_action :authorized

    def index
        playlists = Playlist.all
        render json: playlists
    end

    def show
        playlist = Playlist.find_by(id: params["id"])
        total_likes = playlist.likes.count
        render json: playlist
    end

    def create
        
        playlist = Playlist.create(title: params[:name], user_id: params[:user_id])
        render json: playlist
    end

    def destroy
        playlist = Playlist.find_by(id: params["id"])
        playlist.destroy()
        render json: playlist
    end
end