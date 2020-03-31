class HomeController < ApplicationController
  before_action :set_auth 

  def index
    if params[:category_id]
      @posts = Post.select(["approved_by", "id", "ad_title"]).where.not(approved_by: ['null', 'rejected'])
      @posts = @posts.where(category_id: params[:category_id])
    else
      @posts = Post.select(["approved_by", "id", "ad_title"]).where.not(approved_by: ['null', 'rejected'])
    end 
  end

  private 
  
  def set_auth
    @auth = session[:omniauth] if session[:omniauth]
  end
end
