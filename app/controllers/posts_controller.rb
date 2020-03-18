class PostsController < ApplicationController
    before_action :set_post, only: [:show]

    
    def index
        @posts = Post.all
        
        @posts.each do |p| 
            @post_attachments = p.post_attachments.all
        end 
    end     

    def show
        @post_attachments = @post.post_attachments.all
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
            render "new"
        end
    end

    


    private

    def post_params
        params.require(:post).permit(:ad_title, :category_id, :ad_description, :user_name, :phone, :city, post_attachments_attributes: [:id, :post_id, :photo])
    end

    def set_post
        @post = Post.find(params[:id])
    end

    

end
