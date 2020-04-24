class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def create
    @user = User.new(user_params)

    if @user.buyer_post_id.present?
      if @user.save
        flash[:success] = "You have successfully registered. Now you can put your buying request with the credentials."
        UserMailer.welcome_email(@user).deliver_now
      else
        flash[:danger] = "Invalid Name format. Name cannot only contain alphabets"
      end
      redirect_to new_buyer_path({ post_id: @user.buyer_post_id })
      
    else
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
        flash[:warning] = "You already have an account/Your credentials are not valid" 
        render "new"
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def new
    if logged_in?
      flash[:warning] = "You have already logged in."
      redirect_to root_path
      return
    end
    
    @user = User.new({ buyer_post_id: params[:buyer_post_id], email: params[:email], name: params[:buyer_name] })
  end

  def rejected
    @user = current_user
    @posts = @user.posts.where("approved_by='rejected'")
  end

  def show
    @posts = @user.posts.where.not(approved_by: ['null', 'rejected'])
  end

  def unchecked
    @user = current_user
    @posts = @user.posts.where("approved_by='null'")
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

  private
  
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin, :provider, :uid, :buyer_post_id)
  end

end
