class PlaylistsController < ApplicationController
    def index
        playlists = Playlist.all
        render json: playlists
    end

    def show
        playlist = Playlist.find_by(id: params["id"])
        render json: playlist
    end

    def create
        playlist = Playlist.create(name: params[:name], user_id: params[:user_id])
        render json: playlist
    end

    def destroy
        playlist = Playlist.find_by(id: params["id"])
        playlist.destroy()
        render json: playlist
    end
end