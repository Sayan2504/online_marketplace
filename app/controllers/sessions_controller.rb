class SessionsController < ApplicationController
    before_action :set_user, only: :create

    def new
    end
  
    def create
      if @user&.authenticate(params[:session][:password])
        flash[:success] = "You have successfully logged in"
        redirect_to root_path
      else
        flash.now[:danger] = "Email/Password combination is incorrect."
        render "new"
      end
    end
  
    private
  
    def set_user
      @user = User.find_by(email: params[:session][:email].downcase)
    end
end
