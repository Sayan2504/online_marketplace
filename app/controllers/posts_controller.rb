class PostsController < ApplicationController
    before_action :set_post, only: [:show]

    
    def index
        @category = Category.find_by(id: params[:category_id])
        
        #if params[:category_id]
        #    @posts = Post.select(["approved_by", "id", "ad_title"]).where.not(approved_by: ['null', 'rejected'])
        #    @posts = @posts.where(category_id: params[:category_id])
        #else
        #    @posts = Post.select(["approved_by", "id", "ad_title"]).where.not(approved_by: ['null', 'rejected'])
        #end 

        if params[:ad_title]
            @posts = Post.where(ad_title: params[:ad_title])
            @posts = @posts.select(["approved_by", "id", "ad_title"]).where.not(approved_by: ['null', 'rejected'])
        else
            @posts = Post.select(["approved_by", "id", "ad_title"]).where.not(approved_by: ['null', 'rejected'])
        end 
    end     

    def show
        @user = current_user
        @post_attachments = @post.post_attachments.all
        @reviews = @post.reviews.all
    end

    def new
        @post = Post.new
        @post_attachment = @post.post_attachments.build
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        

        if @post.save
            params[:post_attachments]['photo'].each do |a|
                @post_attachment = @post.post_attachments.create(:photo => a, :post_id => @post.id, :user_id => current_user.id)
            end
            flash[:success] = "Post has been successfully created"
            redirect_to post_path(@post)
        else
          @post_attachment = @post.post_attachments.build
          render "new"
        end
    end

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


    def rapprove
        @review = Review.where(id: params[:id])
        @review_unique = @review.first
        @post = @review_unique.post
        @user = @post.user
        
       
        if params[:decision] == "true"
            PostMailer.review(@user, @review_unique, @post).deliver_now
            @review.update(approved_by: current_user.name)
            flash[:success] = "This review has been approved by Admin"
            redirect_to request.referrer
        end
    end
    


    private

    def post_params
        params.require(:post).permit(:ad_title, :detailed_ad_title, :category_id, :ad_description, :user_name, :phone, :city, post_attachments_attributes: [:id, :post_id, :photo])
    end

    def set_post
        @post = Post.find(params[:id])
    end

    

end
