class ReviewsController < ApplicationController
   
  def create
    @review = Review.new(review_params)
    @review.post_id = Post.find(@review.post_id).id
    if @review.save
        flash[:success] = "Your review is send to admin for approval. You can see it once admin approves it"
        redirect_to post_path(@review.post_id)
    else
        flash[:danger] = "Invalid credentials"
        redirect_to new_review_path({ post_id: @review.post_id })
    end
  end

  def index
    @reviews = Review.all
  end 

  def new
    @post = Post.find(params[:post_id])
    @review = Review.new
  end
  
  private

  def review_params
    params.require(:review).permit(:name, :review, :post_id, :email, :location, :rating)
  end
end
