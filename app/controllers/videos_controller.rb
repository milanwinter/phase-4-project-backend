class VideosController < ApplicationController
    def index
        videos = Video.all
        render json: videos
    end

    def show
        video = video.find_by(id: params["id"])
        render json: video
    end

    def create
        video = video.create(name: params[:name], playlist_id: params[:playlist_id])
        render json: video
    end

    def destroy
        video = video.find_by(id: params["id"])
        video.destroy()
        render json: video
    end
end