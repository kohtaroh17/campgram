class Public::CampersController < ApplicationController
 
   before_action :set_q
   
   before_action :authenticate_camper!, {only: [:edit, :update]}
   
   before_action :set_camper, only: [:likes]
  
   def show
    @camper = Camper.find(params[:id])
    @posts = @camper.posts
   end
   
   def index
    @campers = Camper.all
   end
   
   def search
    @results = @q.result
   end
   
   def update
    @camper = current_camper
     if @camper.update(camper_params)
      flash[:update] = "You have updated user info successfully."
      redirect_to camper_path(@camper.id)
     else
      render 'edit'
     end
   end
   
   def destroy
      @camper = Camper.find(params[:id]) 
      @camper.destroy
      flash[:notice] = 'ユーザーを削除しました。'
      redirect_to :root #削除に成功すればrootページに戻る
  end
  
  def likes
    likes = Like.where(camper_id: @camper.id).pluck(:post_id)
    @like_posts = Post.find(likes)
  end

   
   
   private
   
   def set_q
    @q = Camper.ransack(params[:q])
   end
   
   def set_camper
    @camper = Camper.find(params[:id])
  end
   
   def camper_params
     params.permit(:camper_name, :last_name, :first_name, :email, :password, :profiel_image)
   end 
end
