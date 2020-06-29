FactoryBot.define do
  factory :buyer do
    buyer_name { "Someone" }
    email { "someone@gmail.com" }
    location { "somewhere" }
    user_id { 1 }
    post_id { 1 }
    user { create(:usernew) }
  end

  factory :buyer2, class: Buyer do
    buyer_name { "Someone" }
    email { "someone@gmail.com" }
    location { "somewhere" }
    user_id { 1 }
    post_id { 1 }
    user { create(:user4) }
  end

  factory :buyer3, class: Buyer do
    buyer_name { "Someone" }
    email { "someone2@gmail.com" }
    location { "somewhere" }
    user_id { 1 }
    post_id { 1 }
    user { create(:user5) }
  end
end