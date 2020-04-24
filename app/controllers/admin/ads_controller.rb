class Admin::AdsController < ApplicationController
    
  def approve
    @post = Post.where(id: params[:id])
    @post_unique = @post.first
    @user = @post_unique.user

    if params[:decision] == "true"
        PostMailer.post_approved(@post_unique, @user).deliver_now

        @post.update(approved_by: current_user.name)
        flash[:success] = "This post has been approved by Admin"
        redirect_to admin_approved_path
        
    else
        @post.update(approved_by: "rejected")
        flash[:danger] = "This post has been rejected by Admin"
        redirect_to admin_rejected_path
    end  
  end

  def approved 
    @posts = Post.where.not(approved_by: ['null', 'rejected'])
  end

  def reject
    @post = Post.where(id: params[:id])
    @post_unique = @post.first
    @user = @post_unique.user

    if params[:decision] == "false"
      PostMailer.post_rejected(@post_unique, @user).deliver_now
      
      @post.update(approved_by: "rejected")
      flash[:danger] = "This post has been rejected by Admin"
      redirect_to admin_rejected_path
    else
      @post.update(approved_by: current_user.name)
      flash[:success] = "This post has been approved by Admin"
      redirect_to admin_approved_path
    end
  end  

  def rejected
    @posts = Post.where("approved_by='rejected'")
  end

  def unchecked
    @posts = Post.where("approved_by='null'")
  end
end
