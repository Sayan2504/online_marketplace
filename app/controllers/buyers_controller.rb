class BuyersController < ApplicationController
  before_action :set_post, only: [:index, :new]

  def create
    @buyer = Buyer.new(buyer_params)
    @user = User.find_by(email: @buyer.email)
    @post = Post.find(@buyer.post_id)
    @user_email = @post.user
    @buyer_user = Buyer.buyer_post_id(@buyer.post_id)
    @buyer_user = @buyer_user.find_by(email: @buyer.email)  
    @user_author = @buyer.user
    if @user.present?
      if @user.email == @user_email.email
        redirect_to post_path(@buyer.post_id), flash: { warning: "You cannot put a buying request to your own advertisement" }
      else
        if @buyer_user.present?
          redirect_to post_path(@buyer.post_id), flash: { warning: "You already have a buying request for this post. You need not request again" }
        else
          if @buyer.save
            BuyerMailer.buying_request(@buyer, @user_email, @post).deliver_now
            BuyerMailer.buying_request_sent(@buyer, @user_email, @post).deliver_now
            redirect_to post_path(@buyer.post_id), flash: { success: "Your buying request has been send to the author of the post #{ @user_author.name }" }
          else
            render "new"
          end
        end
      end 
    else
      redirect_to signup_path(buyer_post_id: @buyer.post_id, email: @buyer.email), flash: { warning: "Please register yourself before buying #{ @post.ad_title }" }
    end      
  end

  def index
    @buyers = Buyer.buyer_post_id(params[:post_id])
  end

  def new
    @user = @post.user
    @buyer = Buyer.new
  end

  def bought
    @buyer = Buyer.buyer_email(current_user.email)
    @posts = Post.product_bought_sold(@buyer.ids)
  end
  
  def sell
    @buyer = Buyer.find(params[:id])
    @post = Post.find(@buyer.post_id)
    @user = @post.user
    if params[:decision] == "true"
      BuyerMailer.sell(@buyer, @post, @user).deliver_now
      BuyerMailer.bought(@buyer, @post, @user).deliver_now
      if @post.buyer_id == nil
        @post.update(buyer_id: @buyer.id)
        redirect_to request.referrer, flash: { success: "This product has been successfully sold to #{ @buyer.buyer_name }" }
      end
    end
  end

  def sold
    @buyer = Buyer.buyer_user_id(current_user.id)
    @posts = Post.product_bought_sold(@buyer.ids)
  end 

  private

  def buyer_params
    params.require(:buyer).permit(:buyer_name, :user_id, :post_id, :email, :location)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
