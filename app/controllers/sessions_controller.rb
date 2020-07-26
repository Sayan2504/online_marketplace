class SessionsController < ApplicationController
  before_action :set_user, only: :create
  
  def create
    if @user&.authenticate(params[:session][:password])
      log_in(@user)
      if admin_user?
        redirect_to users_path, flash: { success: "You have successfully logged in" }
      else
        redirect_to user_path(@user), flash: { success: "You have successfully logged in" }
      end
    else
      flash.now[:danger] = "Email/Password combination is incorrect."
      render "new"
    end
  end

  def destroy
    return unless logged_in?
    log_out
    redirect_to root_path, flash: { danger: "User has been successfully logged out" }
  end

  def new
    if logged_in?
      redirect_to "/logged_in.html"
    end
  end
 
  def fb_google_create
    auth = request.env["omniauth.auth"]
    session[:omniauth] = auth.except('extra')
    user = User.sign_in_from_omniauth(auth)
    log_in(user)
    redirect_to user_path(user), flash: { success: "You have successfully logged in" }
  end

  private

  def set_user
    @user = User.find_by(email: params[:session][:email].downcase)
  end
    
end
