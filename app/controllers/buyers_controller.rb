class BuyersController < ApplicationController

    def new
        @post = Post.find(params[:post_id])
        @user = @post.user
        @buyer = Buyer.new
    end

    def create
        @buyer = Buyer.new(buyer_params)

    end

    def buyers_list
    end




    private

    def buyer_params
      params.require(:buyer).permit(:buyer_name, :user_id, :post_id, :email, :location)
    end
end
