class PostMailer < ApplicationMailer
  default :from => "Online Marketplace"

  def review(user, review, post)
    @user = user
    @review = review
    @post = post
    mail(:to => @user.email, :subject => "You got a review on your post")
  end

  def post_approved(post, user)
    @user = user
    @post = post
    mail(:to => @user.email, :subject => "Your post has been approved")
  end

  def post_rejected(post, user)
    @user = user
    @post = post
    mail(:to => @user.email, :subject => "Your post has been rejected")
  end
end

