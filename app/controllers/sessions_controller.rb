class SessionsController < ApplicationController
  before_action :set_user, only: :create
  
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

  def destroy
    return unless logged_in?

    log_out
    flash[:danger] = "User has been successfully logged out."
    redirect_to root_path
  end

  def new
  end
  
  def fb_google_create
    auth = request.env["omniauth.auth"]
    session[:omniauth] = auth.except('extra')
    user = User.sign_in_from_omniauth(auth)
    log_in(user)
    flash[:success] = "You have successfully logged in"
    redirect_to user_path(user)
  end

  private

  def set_user
    @user = User.find_by(email: params[:session][:email].downcase)
  end
    
end
