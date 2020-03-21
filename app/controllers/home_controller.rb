class HomeController < ApplicationController
  def index
   @posts = Post.select(["approved_by", "id", "ad_title"]).where.not(approved_by: ['null', 'rejected'])
  end
end
