class Public::LikesController < ApplicationController
  
  before_action :authenticate_camper!
  
  def create
   @post = Post.find(params[:post_id])
   @post_like = current_camper.likes.new(post_id: @post.id)
   if @post_like.save
     respond_to :js
   end 
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @post_like = current_camper.likes.find_by(post_id: @post.id)
    if @post_like.destroy
      respond_to :js
    end
  end 
  
  private
    def like_params
      params.permit(:post_id)
    end
end
