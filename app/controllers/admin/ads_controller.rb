class Admin::AdsController < ApplicationController
  before_action :set_post_and_user, only: [:approve, :reject]
    
  def approve
    PostMailer.post_approved(@post_unique, @user).deliver_now
    @post.admin_post_approval(current_user.name)
    redirect_to admin_approved_path, flash: { success: "This post has been approved by Admin" } 
  end

  def approved
    if admin_user?
      @posts = Post.admin_post_approved_state
    else
      redirect_to "/admin_facility.html"
    end
  end

  def reject
    PostMailer.post_rejected(@post_unique, @user).deliver_now
    @post.admin_post_approval("rejected")
    redirect_to admin_rejected_path, flash: { danger: "This post has been rejected by Admin" }
  end  

  def rejected
    if admin_user?
      @posts = Post.admin_post_state("rejected")
    else
      redirect_to "/admin_facility.html"
    end
  end

  def unchecked
    if admin_user?
      @posts = Post.admin_post_state("null")
    else
      redirect_to "/admin_facility.html"
    end
  end

  private
    
  def set_post_and_user
    @post = Post.where_post_id(params[:id])
    @post_unique = @post.first
    @user = @post_unique.user
  end
end
