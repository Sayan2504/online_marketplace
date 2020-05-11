class UserMailer < ApplicationMailer
  default from: "Online Marketplace"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to My Awesome Site")
  end
end
