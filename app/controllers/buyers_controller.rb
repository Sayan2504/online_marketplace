class BuyersController < ApplicationController

    def index
        @buyers = Buyer.select(["id","buyer_name","email","location","post_id"]).where(post_id: params[:post_id])
    end

    def new
        @post = Post.find(params[:post_id])
        @user = @post.user
        @buyer = Buyer.new
    end

    def create
        @buyer = Buyer.new(buyer_params)
        @user = User.select(["email", "name"]).find_by(email: @buyer.email)
        @post = Post.select(["id", "ad_title"]).find_by(id: @buyer.post_id)
        @buyer_user = Buyer.select(["email"]).find_by(email: @buyer.email)
        
        @user_author = @buyer.user

        if @user.present?
            if @buyer_user.present?
                flash[:warning] = "You already have a buying request for this post. You need not request again"
                redirect_to post_path(@buyer.post_id)
            else
                if @buyer.save
                    flash[:success] = "Your buying request has been send to the author of the post #{@user_author.name}"
                    redirect_to post_path(@buyer.post_id)
                else
                    render "new"
                end
            end
        else
            flash[:warning] = "Please register yourself before buying #{@post.ad_title}"
            redirect_to signup_path
        end
    end

    def sell
    end

    def selling
    end




    private

    def buyer_params
      params.require(:buyer).permit(:buyer_name, :user_id, :post_id, :email, :location)
    end
end
