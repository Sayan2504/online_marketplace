class Admin::AdsController < ApplicationController
  before_action :set_post, only: [:approve, :reject]
    
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

  def approved 
    @posts = Post.admin_post_approved_state.post_unsold
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

  def rejected
    @posts = Post.admin_post_state("rejected").post_unsold
  end

  def unchecked
    @posts = Post.admin_post_state("null").post_unsold
  end

  private
    
  def set_post
    @post = Post.where_post_id(params[:id])
    @post_unique = @post.first
  end
end
