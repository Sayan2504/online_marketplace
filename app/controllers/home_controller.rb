class HomeController < ApplicationController
  before_action :set_auth 


  def index
    @posts = Post.select(["approved_by", "id", "ad_title"]).where.not(approved_by: ['null', 'rejected'])
    @categories = Category.all
  end

  private 
  
  def set_auth
    @auth = session[:omniauth] if session[:omniauth]
  end
end
