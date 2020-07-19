class PostsController < ApplicationController  
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_post_unique, only: [:approve, :reject]

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      if params[:post_attachments].present?
        params[:post_attachments]["photo"].each do |a|
          @post_attachment = @post.post_attachments.create(photo: a, post_id: @post.id, user_id: current_user.id)
        end
      end
      redirect_to post_path(@post), flash: { success: "Post has been successfully created" }
    else
      @post_attachment = @post.post_attachments.build
      render "new"
    end
  end

  def edit
    @post_attachment = @post.post_attachments.build
  end

  def update
    if @post.update(post_params)
      @post.user_id = current_user.id
      if params[:post_attachments].present?
        params[:post_attachments]["photo"].each do |a|
          @post_attachment = @post.post_attachments.create(photo: a, post_id: @post.id, user_id: current_user.id)
        end
      end
      redirect_to post_path(@post), flash: { success: "Post has been successfully updated" }
    else
      @post_attachment = @post.post_attachments.build
      render "edit"
    end
  end

  def destroy
    if @post.delete
      redirect_to user_path(current_user.id), flash: { danger: "Post has been successfully deleted" }
    end
  end

  def index
    @posts = Post.admin_post_approved_state
    @posts = @posts.post_unsold.includes(:category)
    @post_ad_title = Post.post_ad_title(params[:ad_title]).post_unsold
    @post_city = Post.post_city(params[:location]).post_unsold
    if params[:user_id]
      if params[:decision] == "true"
        @myposts = Post.users_post(params[:user_id])
        @posts = @posts.users_post(params[:user_id])
      else
        @othersposts = Post.others_post(params[:user_id])
        @posts = @posts.others_post(params[:user_id])
      end
    end 
    if params[:category_id] && !params[:category_id][:id].blank?
      @category = Category.find(params[:category_id][:id])
      @post_unsold = Post.post_category(params[:category_id][:id]).post_unsold
      @post_category = Post.post_category(params[:category_id][:id])       
      @posts = @posts.post_category(params[:category_id][:id]).includes(:category) 
    end
    if params[:ad_title]
      @posts = @posts.post_ad_title(params[:ad_title]).includes(:category)
    end 
    if params[:location]
      @posts = @posts.post_city(params[:location]).includes(:category)
    end
  end     

  def new
    @post = Post.new
    @post_attachment = @post.post_attachments.build
  end
    
  def show
    @user = @post.user
    @post_attachments = @post.post_attachments.all
    @reviews = @post.reviews.all
    @user_email = User.all 
    @buyer_user = Buyer.buyer_post_id(@post.id) 
  end

  def approve
    PostMailer.post_approved(@post_unique, @user).deliver_now
    @post.admin_post_approval(current_user.name)
    redirect_to admin_approved_path, flash: { success: "This post has been approved by Admin" }
  end

  def approve_review
    @review = Review.where(id: params[:id])
    @review_unique = @review.first
    @post = @review_unique.post
    @user = @post.user
    PostMailer.review(@user, @review_unique, @post).deliver_now
    @review.admin_review_approval(current_user.name)
    redirect_to post_path(@post), flash: { success: "This review has been approved by Admin" }
  end
  
  def reject
    PostMailer.post_rejected(@post_unique, @user).deliver_now
    @post.admin_post_approval("rejected")
    redirect_to admin_rejected_path, flash: { danger: "This post has been rejected by Admin" }
  end
  
  private

  def post_params
    params.require(:post).permit(:ad_title, :detailed_ad_title, :category_id, :ad_description, :user_name, :phone, :city, post_attachments_attributes: [:id, :post_id, :photo])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_post_unique
    @post = Post.where_post_id(params[:id])
    @post_unique = @post.first
    @user = @post_unique.user
  end
end


