class PostMailer < ApplicationMailer
    default :from => "from@example.com"

    def welcome_email(user)
        @user = user
        @url  = "http://example/login"
        mail(:to => @user.email, :subject => "Welcome to My Awesome Site")
    end
end
