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
        UserMailer.welcome_email(@user).deliver_now
        if admin_user?
          redirect_to users_path
        else
          redirect_to user_path(@user)
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
      @posts = @user.posts.select(["approved_by", "id", "ad_title"]).where.not(approved_by: ['null', 'rejected'])
    end

    def unchecked
      @user = current_user
      @posts = @user.posts.select(["approved_by", "id", "ad_title"]).where("approved_by='null'")
    end

    def rejected
      @user = current_user
      @posts = @user.posts.select(["approved_by", "id", "ad_title"]).where("approved_by='rejected'")
    end
    
    private
    
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin, :provider, :uid, :location)
    end

    def set_user
      @user = User.find(params[:id])
    end

end
