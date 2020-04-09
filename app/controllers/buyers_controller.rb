class BuyersController < ApplicationController

    def new
        @post = Post.find(params[:post_id])
        @user = @post.user
        @buyer = Buyer.new
    end

    def create
        @buyer = Buyer.new(buyer_params)
        @buyer_id = User.select(["email"]).find_by(email: @buyer.email)
        if @buyer_id.present?
            if @buyer.save
                flash[:success] = "Your buying request has been send to the author of the post"
                redirect_to post_path(@buyer.post_id)
            else
                render "new"
            end
        else
            flash[:warning] = "Please register yourself before buying"
            redirect_to signup_path
        end
    end

    def buyers_list
    end




    private

    def buyer_params
      params.require(:buyer).permit(:buyer_name, :user_id, :post_id, :email, :location)
    end
end
