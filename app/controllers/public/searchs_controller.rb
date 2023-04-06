class Public::SearchsController < ApplicationController

  def search

    @range = params[:range]

    if @range == "Camper"
      @campers = Camper.looks(params[:search], params[:word])
    else
      @posts = Post.looks(params[:search], params[:word])
    end

  end


end
