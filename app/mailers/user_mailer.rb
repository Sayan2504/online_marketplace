class UserMailer < ApplicationMailer
  default from: "Online Marketplace"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to My Awesome Site")
  end

  def welcome_email_social(user)
    @user = user
    mail(to: @user.email, subject: "You have successfully logged in")
  end
end
