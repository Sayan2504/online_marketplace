class HomeController < ApplicationController
  def index
   @posts = Post.all.select(["approved_by", "id", "ad_title"]).where("approved_by= 'Admin_user'")
  end
end
