class Public::RelationshipsController < ApplicationController

  def create
    current_camper.follow(params[:camper_id])
    redirect_to request.referer
  end

  def destroy
    current_camper.unfollow(params[:camper_id])
    redirect_to request.referer
  end

  def followings
    camper = Camper.find(params[:camper_id])
    @camper = camoer.followings
  end

  def followers
    camper = Camper.find(params[:camper_id])
    @camper = camper.followers
  end
end
