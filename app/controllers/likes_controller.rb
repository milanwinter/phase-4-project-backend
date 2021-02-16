class LikesController < ApplicationController
    before_action :find_playlist

    before_action :find_like, only: [:destroy]




   def create
    if already_liked?
        flash[:notice] = "You can't like more than once"
    else
        @post.likes.create(user_id: current_user.id)
    end
   end

   def index
       likes = Likes.all
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

   def find_post
     @playlist = Playlist.find(params[:playlist_id])
   end

   def already_liked?
        Like.where(user_id: current_user.id, playlist_id: params[:playlist_id]).exists?
   end

 end