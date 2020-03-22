class ReviewsController < ApplicationController
    
    def new
        @review = Review.new
    end
    
    def create
        @review = Review.new(review_params)
        @review.post_id = @post.id

        if @review.save
            flash[:success] = "Your review is send to the admin for approval"
            redirect_to post_path(@post)
        else
            render "new"
        end
    end

    private

    def review_params
      params.require(:review).permit(:name, :review)
    end
end
