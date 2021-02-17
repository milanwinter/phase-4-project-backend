class LikesController < ApplicationController

    before_action :find_playlist, only: [:create]

    before_action :find_like, only: [:destroy]




   def create
    response = ""
    if already_liked?
        response = "You can't like more than once"
    else
       @playlist.likes.create(user_id: current_user.id)
       response = "Item was successfully created"
    end
        render json: {message: response}
   end

   def index
       likes = Like.all
       render json: likes
   end

   def destroy
       if !(already_liked?)
        flash[:notice] = "cannot unlike" 
       else
        @like.destroy
        flash[:notice] = "unliked"
       end
   end


   private

   def find_like
    @like = @playlist.likes.find(params[:id])
   end

   def find_playlist
     @playlist = Playlist.find(params[:playlist_id])
   end

   def already_liked?
        Like.where(user_id: current_user.id, playlist_id: params[:playlist_id]).exists?
   end

 end