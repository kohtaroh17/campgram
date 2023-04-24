class Public::SearchsController < ApplicationController

  def search

    @range = "Post"
    @posts = Post.left_joins(:camper).where("caption LIKE ? or camper_name LIKE ?", "%#{params[:word]}%", "%#{params[:word]}%")
    pp "hoge", @posts
      # if @range == "Camper"
      #   @campers = Camper.looks(params[:search], params[:word])
      # else
      #   @posts = Post.looks(params[:search], params[:word])
      # end

  end


end
