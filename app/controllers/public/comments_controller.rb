class Public::CommentsController < ApplicationController

  before_action :authenticate_camper!

  def index
    @comments = @post.coments.includes(:camper)
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
    comment = Comment.find_by(id: params[:id], post_id: params[:post_id])
    comment.destroy
    redirect_to post_path(comment.post)
  end

  private
    def comment_params
      params.require(:comment).permit(:comment).merge(camper_id: current_camper.id, post_id: params[:post_id])
    end
end
