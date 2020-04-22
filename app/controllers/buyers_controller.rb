class BuyersController < ApplicationController

  def index
    @buyers = Buyer.select(["id","buyer_name","email","location","post_id"]).where(post_id: params[:post_id])
    @post = Post.find_by(id: params[:post_id])
  end

  def new
    @post = Post.find(params[:post_id])
    @user = @post.user
    @buyer = Buyer.new
  end

  def create
    @buyer = Buyer.new(buyer_params) #creating new buyer
    @user = User.select(["email", "name"]).find_by(email: @buyer.email) #checking if user is registered or not
    @post = Post.select(["id", "ad_title", "user_id"]).find_by(id: @buyer.post_id) #getting the post for which buyer request is being sent

    @user_email = @post.user

    #checking if buyer has already requested or not
    @buyer_user = Buyer.where(post_id: @buyer.post_id)  
    @buyer_user = @buyer_user.find_by(email: @buyer.email)
        
    #getting the author of the post   
    @user_author = @buyer.user
   
        
    if @user.present?
      if @user.email == @user_email.email
        flash[:warning] = "You cannot put a buying request to your own advertisement"
        redirect_to post_path(@buyer.post_id)
      else
        if @buyer_user.present?
          flash[:warning] = "You already have a buying request for this post. You need not request again"
          redirect_to post_path(@buyer.post_id)
        else
          if @buyer.save
            BuyerMailer.buying_request(@buyer, @user_email, @post).deliver_now
            BuyerMailer.buying_request_sent(@buyer, @user_email, @post).deliver_now
            flash[:success] = "Your buying request has been send to the author of the post #{@user_author.name}"
            redirect_to post_path(@buyer.post_id)
          else
            render "new"
          end
        end
      end
        
    else
      flash[:warning] = "Please register yourself before buying #{@post.ad_title}"
      redirect_to signup_path(buyer_post_id: @buyer.post_id, email: @buyer.email)
    end      
  end



  def sell
    @buyer = Buyer.find_by(id: params[:id])
    @post = Post.find_by(id: @buyer.post_id)
    @user = @post.user

    if params[:decision] == "true"
      BuyerMailer.sell(@buyer, @post, @user).deliver_now
      BuyerMailer.bought(@buyer, @post, @user).deliver_now

      if @post.buyer_id == nil
        @post.update!(buyer_id: @buyer.id)
        redirect_to request.referrer
      end
    end
  end




  def bought
      @buyer = Buyer.where(email: current_user.email)
      @posts = Post.where(buyer_id: @buyer.ids)
  end




  def sold
      @buyer = Buyer.where(user_id: current_user.id)
      @posts = Post.where(buyer_id: @buyer.ids)
  end 




  private

  def buyer_params
    params.require(:buyer).permit(:buyer_name, :user_id, :post_id, :email, :location)
  end
end
