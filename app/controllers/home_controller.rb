class HomeController < ApplicationController
  before_action :set_auth 

  def index
    if logged_in?
      redirect_to "/logged_in.html"
    end
  end

  private 
  
  def set_auth
    @auth = session[:omniauth] if session[:omniauth]
  end
end
