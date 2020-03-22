class ReviewsController < ApplicationController
    
    def index
    end 

    def new
        @review = Review.new
    end
    
    def create
        @review = Review.new(review_params)

        if @review.save
            flash[:success] = "Your review is send to the admin for approval"
            redirect_to reviews_path
        else
            render "new"
        end
    end

    private

    def review_params
      params.require(:review).permit(:name, :review)
    end
end
