FactoryBot.define do
  factory :buyer do
    buyer_name { "Someone" }
    email { "someone@gmail.com" }
    location { "somewhere" }
    user_id { 1 }
    post_id { 2 }
    user { create(:user1) }
  end
end