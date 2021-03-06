class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :rejected, :show, :unchecked, :update, :index]
  before_action :set_post, only: [:show, :index]

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
    if !logged_in?
      redirect_to "/logged_out.html"
    end
  end

  def index
    if !@user.present?
      redirect_to root_path, flash: { warning: "Please log in/Sign up to continue" }
    end
  end

  def new
    if logged_in?
      redirect_to "/logged_in.html"
    end
    @user = User.new( { buyer_post_id: params[:buyer_post_id], email: params[:email], name: params[:buyer_name] } )
  end

  def show
    if !@user.present?
      redirect_to root_path, flash: { warning: "Please log in/Sign up to continue" }
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), flash: { success: "Email/Password has been successfully updated" }
    else
      render "edit"
    end
  end

  def rejected
    if logged_in?
      @posts = @user.posts.admin_post_state("rejected")
    else
      redirect_to "/logged_out.html"
    end
  end

  def unchecked
    if logged_in?
      @posts = @user.posts.admin_post_state("null")
    else
      redirect_to "/logged_out.html"
    end
  end

  private
  
  def set_user
    @user = current_user
  end

  def set_post
    if @user.present?
      @posts = @user.posts.admin_post_approved_state
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin, :provider, :uid, :buyer_post_id)
  end

end
