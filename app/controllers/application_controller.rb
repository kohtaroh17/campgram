class ApplicationController < ActionController::Base
  before_action :set_q
  
  before_action :set_p
  
  def search
    @q = params[:q]
    
    @p = params[:p]

    @camper = Camper.ransack(camper_name_cont: @q).result
    @posts = Post.ransack(content_cont: @p).result
  end
  
  
  private
   
   def set_q
    @q = Camper.ransack(params[:q])
   end
   
   def set_p
    @p = Post.ransack(params[:p])
   end
  
end
