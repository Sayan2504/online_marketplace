class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :rejected, :show, :unchecked, :update]

  def create
    @user = User.new(user_params)
    if @user.buyer_post_id.present?
      if @user.save
        UserMailer.welcome_email(@user).deliver_now
        redirect_to new_buyer_path({ post_id: @user.buyer_post_id }), flash: { success: "You have successfully registered. Now you can put your buying request with the credentials" }
      else
        redirect_to new_buyer_path({ post_id: @user.buyer_post_id }), flash: { danger: "Invalid Name format. Name cannot only contain alphabets" }
      end
    else
      if @user.save
        log_in(@user)
        UserMailer.welcome_email(@user).deliver_now
        if admin_user?
          redirect_to users_path, flash: { success: "You have successfully signed up" }
        else
          redirect_to user_path(@user), flash: { success: "You have successfully signed up" } 
        end
      else
        flash.now[:danger] = "You already have an account/Your credentials are not valid"
        render "new"
      end
    end
  end

  def edit
  end

  def index
  end

  def new
    if logged_in?
      redirect_to root_path, flash: { warning: "You have already logged in" }
      return
    end
    @user = User.new( { buyer_post_id: params[:buyer_post_id], email: params[:email], name: params[:buyer_name] } )
  end

  def show
    @posts = @user.posts.admin_post_approved_state
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), flash: { success: "Email/Password has been successfully updated" }
    else
      render "edit"
    end
  end

  def rejected
    @posts = @user.posts.admin_post_state("rejected")
  end

  def unchecked
    @posts = @user.posts.admin_post_state("null")
  end

  private
  
  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin, :provider, :uid, :buyer_post_id)
  end

end
