class ReviewsController < ApplicationController
  before_action :set_review, only: [:update, :edit, :destroy, :show]

  def create
    @review = Review.new(review_params)
    @review.post_id = Post.find(@review.post_id).id
    if @review.save
      redirect_to post_path(@review.post_id), flash: { success: "Your review is send to admin for approval. You can see it once admin approves it" }
    else
      redirect_to new_review_path( { post_id: @review.post_id } ), flash: { danger: "Invalid credentials/blank fields" }
    end
  end

  def new
    @post = Post.find(params[:post_id])
    @review = Review.new
  end

  def edit
    @current_post = Post.find(@review.post_id)
    if logged_in?
      if @current_post.user_id != current_user.id
        @post = Post.find(@review.post_id)
      else
        redirect_to "/invalid_user.html"
      end
    else
      redirect_to "/logged_out.html"
    end
  end

  def update
    if @review.update(review_params)
      @review.post_id = Post.find(@review.post_id).id
      redirect_to post_path(@review.post_id), flash: { success: "Review has been successfully updated" }
    else
      render "edit"
    end
  end

  def destroy
    if @review.delete
      redirect_to post_path(@review.post_id), flash: { danger: "Review has been successfully deleted" }
    end
  end

  def show
  end
  
  private

  def review_params
    params.require(:review).permit(:name, :review, :post_id, :email, :location, :rating)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
