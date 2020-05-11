class AdMailer < ApplicationMailer
  default from: "Online Marketplace"

  def post_approved(post, user)
    @user = user
    @post = post
    mail(to: @user.email, subject: "Your post has been approved")
  end

  def post_rejected(post, user)
    @user = user
    @post = post
    mail(to: @user.email, subject: "Your post has been rejected")
  end
end
