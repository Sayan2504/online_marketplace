class UsersController < ApplicationController

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
        redirect_to posts_path
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
        redirect_to posts_path
      else
        render 'edit'
      end
    end
    
    private
    
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
    end

end
