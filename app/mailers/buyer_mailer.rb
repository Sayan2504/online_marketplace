class BuyerMailer < ApplicationMailer
    default :from => "Sayan Online Marketplace"

    def buying_request(buyer, user, post)
        @buyer = buyer
        @user = user
        @post = post

        mail(:to => @user.email, :subject => "Your post has a new buying request")
    end

    def buying_request_sent(buyer, user, post)
        @buyer = buyer
        @user = user
        @post = post

        mail(:to => @buyer.email, :subject => "Your buying request has been sent")
    end

    def sell(buyer, post, user)
        @buyer = buyer
        @user = user
        @post = post

        mail(:to => @user.email, :subject => "Your product has been sold")
    end

    def bought(buyer, post, user)
        @buyer = buyer
        @user = user
        @post = post

        mail(:to => @buyer.email, :subject => "Your buying request has been approved")
    end
end
