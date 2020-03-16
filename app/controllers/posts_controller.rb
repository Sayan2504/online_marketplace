class PostsController < ApplicationController
    before_action :set_post, only: [:show]

    def index
        @posts = Post.all
    end     

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id

        if @post.save
            flash[:success] = "Post has been successfully created"
            redirect_to post_path(@post)
        else
            render "new"
        end
    end


    private

    def post_params
        params.require(:post).permit(:ad_title, :category_id, :ad_description, :user_name, :phone, :city, :image)
    end

    def set_post
        @post = Post.find(params[:id])
    end

end
