# Preview all emails at http://localhost:3000/rails/mailers/ad_mailer
class AdMailerPreview < ActionMailer::Preview
  def post_approved
    PostMailer.post_approved(@post_unique, @user)
  end

  def post_rejected
    PostMailer.post_rejected(@post_unique, @user)
  end
end
