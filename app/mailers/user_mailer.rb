class UserMailer < ApplicationMailer
    default :from => "myonlinemarketplace03@gmail.com"

    def welcome_email(user)
        @user = user
        @url  = "http://www.example.com"
        mail(:to => @user.email, :subject => "Welcome to My Awesome Site")
    end
end
