class SessionsController < ApplicationController
    before_action :set_user, only: :create

    
    def new
    end
    
  
    def create
      if @user&.authenticate(params[:session][:password])
        log_in(@user)
        flash[:success] = "You have successfully logged in"
        if admin_user?
          redirect_to posts_path
        else
          redirect_to user_path(@user)
        end

      else
        flash.now[:danger] = "Email/Password combination is incorrect."
        render "new"
      end
    end

    

    def destroy
      return unless logged_in?
  
      log_out
      flash[:danger] = "User has been successfully logged out."
      redirect_to root_path
    end
  
  
  
    private

    def set_user
      @user = User.find_by(email: params[:session][:email].downcase)
    end

end
