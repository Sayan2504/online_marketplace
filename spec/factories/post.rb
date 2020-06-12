FactoryBot.define do
  factory :post, aliases: [:post1, :post2, :post3] do
    ad_title { "Something" }
    detailed_ad_title  { "something" }
    ad_description { "something" }
    user_name { "someone" }
    phone { "91-9876543210" }
    city { "somewhere" }
    user_id { 1 }
    user { create(:user1) }
    category { create(:category) }
  end

  factory :post_duplicate do
    ad_title { "Something2" }
    detailed_ad_title  { "something2" }
    ad_description { "something2" }
    user_name { "someone2" }
    phone { "92-9876543210" }
    city { "some where" }
    user_id { 1 }
    user { create(:user2) }
    category { create(:category) }
  end
end