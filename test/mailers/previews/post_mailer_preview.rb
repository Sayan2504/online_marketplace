# Preview all emails at http://localhost:3000/rails/mailers/post_mailer
class PostMailerPreview < ActionMailer::Preview
  def review
    PostMailer.review(@user, @review_unique, @post)
  end

  def post_approved
    PostMailer.post_approved(@post_unique, @user)
  end

  def post_rejected
    PostMailer.post_rejected(@post_unique, @user)
  end
end
