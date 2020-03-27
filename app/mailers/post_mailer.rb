class PostMailer < ApplicationMailer
    default :from => "Sayan Online Marketplace"

    def welcome_email(user)
        @user = user
        @url  = "http://www.example/login"
        mail(:to => @user.email, :subject => "Welcome to My Awesome Site")
    end
end
