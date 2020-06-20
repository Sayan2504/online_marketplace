class Admin::AdsController < ApplicationController
  before_action :set_post, only: [:approve, :reject]
    
  def approve
    @post = Post.where_post_id(params[:id])
    @post_unique = @post.first
    @user = @post_unique.user
    PostMailer.post_approved(@post_unique, @user).deliver_now
    @post.admin_post_approval(current_user.name)
    redirect_to admin_approved_path, flash: { success: "This post has been approved by Admin" } 
  end

  def approved
    @posts = Post.admin_post_approved_state
  end

  def reject
    @post = Post.where_post_id(params[:id])
    @post_unique = @post.first
    @user = @post_unique.user
    PostMailer.post_rejected(@post_unique, @user).deliver_now
    @post.admin_post_approval("rejected")
    redirect_to admin_rejected_path, flash: { danger: "This post has been rejected by Admin" }
  end  

  def rejected
    @posts = Post.admin_post_state("rejected")
  end

  def unchecked
    @posts = Post.admin_post_state("null")
  end

  private
    
  def set_post
    @post = Post.where_post_id(params[:id])
    @post_unique = @post.first
  end
end
