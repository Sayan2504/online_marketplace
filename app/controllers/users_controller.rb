class UsersController < ApplicationController
    before_action :set_user, only: [:show]

    def index
      @posts = Post.all
    end
  
    def new
      if logged_in?
        flash[:warning] = "You have already logged in."
        redirect_to root_path
        return
      end
        
      @user = User.new
    end

    def create
      @user = User.new(user_params)
    
      if @user.save
        log_in(@user)
        flash[:success] = "You have successfully signed up"
        if admin_user?
          redirect_to users_path
        else
          redirect_to unapproved_path(@user)
        end
      else
        flash[:warning] = "You already have an account" 
        render "new"
      end
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
     
      if @user.update(user_params)
        flash[:success] = "Email/Password has been successfully updated"
        redirect_to user_path(@user)
      else
        render 'edit'
      end
    end

    def show
        @posts = Post.select(["approved_by", "id", "ad_title", "user_id"]).where("approved_by = 'Admin'")
      
    end

    def unchecked
      @posts = Post.select(["approved_by", "id", "ad_title"]).where("approved_by='users'")
    end

    def rejected
      @posts = Post.select(["approved_by", "id", "ad_title"]).where("approved_by='rejected', user_id : params[:current_user.id]")
    end
    
    private
    
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
    end

    def set_user
      @user = User.find(params[:id])
    end

end
