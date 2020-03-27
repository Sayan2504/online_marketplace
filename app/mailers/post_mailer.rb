class PostMailer < ApplicationMailer
    default :from => "Sayan Online Marketplace"

    def review(user, review, post)
        @user = user
        @review = review
        @post = post
        @url  = "http://www.example/login"
        mail(:to => @user.email, :subject => "You got a review on your post")
    end
end
