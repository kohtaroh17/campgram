class Public::CommentsController < ApplicationController

  before_action :authenticate_camper!

  def index
    @comment = @post.comments.includes(:camper)
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      @post = @comment.post
    else
      flash[:alert] = "コメントに失敗しました"
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id], post_id: params[:post_id])
    @comment.destroy
    post = Post.find(params[:post_id])
    #binding.pry
    if params[:format].to_i == 1
      redirect_to post_path(post.id)
    elsif params[:format].to_i == 2
      redirect_to posts_path
    else
      redirect_to root_path
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:comment).merge(camper_id: current_camper.id, post_id: params[:post_id])
    end
end
