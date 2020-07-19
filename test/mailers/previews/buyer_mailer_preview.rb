# Preview all emails at http://localhost:3000/rails/mailers/buyer_mailer
class BuyerMailerPreview < ActionMailer::Preview
  def buying_request
    BuyerMailer.buying_request(@buyer, @user_email, @post)
  end

  def buying_request_sent
    BuyerMailer.buying_request_sent(@buyer, @user_email, @post)
  end

  def sell
    BuyerMailer.sell(@buyer, @post, @user)
  end

  def bought
    BuyerMailer.bought(@buyer, @post, @user)
  end
end
