class ReviewsController < ApplicationController
    
    def index
        @reviews = Review.all
    end 

    def new
        @post = Post.find(params[:post_id])
        @review = Review.new
    end
    
    def create
        @review = Review.new(review_params)
        if @review.save
            flash[:success] = "Your review is send to admin for approval. You can see it once admin approves it"
            redirect_to post_path(@review.post_id)
        else
            render "new"
        end
    end

 

    private

    def review_params
      params.require(:review).permit(:name, :review, :post_id, :email, :location, :rating)
    end
end
