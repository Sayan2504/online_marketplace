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
    approved_by { "admin" }
  end

  factory :postnew, class: Post do
    ad_title { "Something" }
    detailed_ad_title  { "something" }
    ad_description { "something" }
    user_name { "someone" }
    phone { "91-9876543210" }
    city { "somewhere" }
    user_id { 1 }
    user { create(:user1) }
    category { create(:category) }
    approved_by { "rejected" }
  end

  factory :postnew2, class: Post do
    ad_title { "Something" }
    detailed_ad_title  { "something" }
    ad_description { "something" }
    user_name { "someone" }
    phone { "91-9876543210" }
    city { "somewhere" }
    user_id { 1 }
    user { create(:user1) }
    category { create(:category) }
    approved_by { "null" }
  end
end