class PostsController < ApplicationController  
  before_action :set_post, only: [:approve, :reject, :show]
  before_action :set_post_unique, only: [:approve, :reject]

  def approve
    @user = @post_unique.user
        
    if params[:decision] == "true"
      PostMailer.post_approved(@post_unique, @user).deliver_now
      
      @post.admin_post_approval(current_user.name)
      flash[:success] = "This post has been approved by Admin"
      redirect_to admin_approved_path 
    else
      @post.admin_post_approval("rejected")
      flash[:danger] = "This post has been rejected by Admin"
      redirect_to admin_rejected_path
    end
  end

  def approve_review
    @review = Review.where(id: params[:id])
    @review_unique = @review.first
    @post = @review_unique.post
    @user = @post.user
    
    if params[:decision] == "true"
      PostMailer.review(@user, @review_unique, @post).deliver_now
      @review.admin_review_approval(current_user.name)
      flash[:success] = "This review has been approved by Admin"
      redirect_to post_path(@post)
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    
    if @post.save
      if params[:post_attachments].present?
        params[:post_attachments]["photo"].each do |a|
          @post_attachment = @post.post_attachments.create(photo: a, post_id: @post.id, user_id: current_user.id)
        end
      end
      flash[:success] = "Post has been successfully created"
      redirect_to post_path(@post)
    else
      @post_attachment = @post.post_attachments.build
      render "new"
    end
  end

  def index
    #check whether the category is in database and matches the ad_title/location (if given)
    if params[:category_id]
      @category = Category.find(params[:category_id][:id])
      @post_unsold = Post.post_category(params[:category_id][:id]).post_unsold
    end

    #messages for users based on posts on given filtration is present or not present
    @post_ad_title = Post.find_by(ad_title: params[:ad_title]) #check whether ad_title is in database
    @post_city = Post.find_by(city: params[:location]) #check whether location is in database
    
    if params[:category_id]
      @post_category = Post.find_by(category_id: params[:category_id][:id])
    end

    #Showing the thumbnails of posts
         
    #if no filtration given
    @posts = Post.admin_post_approved_state
    @posts = @posts.post_unsold #only posts that are not sold yet

    #filtration based on category
    if params[:category_id]        
      @posts = @posts.post_category(params[:category_id][:id])
    end 

    #filtration based on ad title
    if params[:ad_title]
      @posts = @posts.post_ad_title(params[:ad_title])
    end 

    #filtration based on location
    if params[:location]
      @posts = @posts.post_city(params[:location])
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
  end

  def reject
    @user = @post_unique.user

    if params[:decision] == "false"

      PostMailer.post_rejected(@post_unique, @user).deliver_now

      @post.admin_post_approval("rejected")
      flash[:danger] = "This post has been rejected by Admin"
      redirect_to admin_rejected_path
    else
      @post.admin_post_approval(current_user.name)
      flash[:success] = "This post has been approved by Admin"
      redirect_to admin_approved_path
    end
  end
  
  private

  def post_params
    params.require(:post).permit(:ad_title, :detailed_ad_title, :category_id, :ad_description, :user_name, :phone, :city, post_attachments_attributes: [:id, :post_id, :photo])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_post_unique
    @post = Post.where(id: params[:id])
    @post_unique = @post.first
  end
end


