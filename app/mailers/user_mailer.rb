class UserMailer < ApplicationMailer
    default :from => "Sayan Online Marketplace"

    def welcome_email(user)
        @user = user
        mail(:to => @user.email, :subject => "Welcome to My Awesome Site")
    end
end
