class SessionsController < ApplicationController
    before_action :set_user, only: :create

    
    def new
    end
    
  
    def create
      if @user&.authenticate(params[:session][:password])
        log_in(@user)
        flash[:success] = "You have successfully logged in"
        if admin_user?
          redirect_to users_path
        else
          redirect_to user_path(@user)
        end

      else
        flash.now[:danger] = "Email/Password combination is incorrect."
        render "new"
      end
    end

    def google_create
      if user = authenticate_with_google
        cookies.signed[:user_id] = user.id
        redirect_to user
      else
        redirect_to new_session_url, alert: 'authentication_failed'
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

    def authenticate_with_google
      if id_token = flash[:google_sign_in][:id_token]
        User.find_by google_id: GoogleSignIn::Identity.new(id_token).user_id
      elsif error = flash[:google_sign_in][:error]
        logger.error "Google authentication error: #{error}"
        nil
      end
    end
    
end
