class Admin::AdsController < ApplicationController
    
    def unchecked
        @posts = Post.select(["approved_by", "id", "ad_title"]).where("approved_by='null'")
    end

    def rejected
        @posts = Post.select(["approved_by", "id", "ad_title"]).where("approved_by='rejected'")
    end

    def approved 
       @posts = Post.select(["approved_by", "id", "ad_title"]).where.not(approved_by: ['null', 'rejected'])
    end

    def approve
        @post = Post.where(id: params[:id])
        if params[:decision] == "true"
            @post.update(approved_by: current_user.name)
            flash[:success] = "This post has been approved by Admin"
            redirect_to admin_approved_path
            
        else
            @post.update(approved_by: "rejected")
            flash[:danger] = "This post has been rejected by Admin"
            redirect_to admin_rejected_path
        end
        
    end

    def reject
        @post = Post.where(id: params[:id])
        if params[:decision] == "false"
            @post.update(approved_by: "rejected")
            flash[:danger] = "This post has been rejected by Admin"
            redirect_to admin_rejected_path
        else
            @post.update(approved_by: current_user.name)
            flash[:success] = "This post has been approved by Admin"
            redirect_to admin_approved_path
        end
    end  
end
