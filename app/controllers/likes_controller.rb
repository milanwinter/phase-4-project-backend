class LikesController < ApplicationController
    before_action :find_playlist





   def create
     @post.likes.create(user_id: current_user.id)
     redirect_to post_path(@post)
   end




   private
   def find_post
     @playlist = Post.find(params[:playlist_id])
   end

   
 end