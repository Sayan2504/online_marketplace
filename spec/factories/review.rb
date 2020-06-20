FactoryBot.define do
  factory :review do
    name { "Someone" }
    email { "someone@gmail.com" }
    location { "somewhere" }
    review { "something" }
    rating { "5" }
    post_id { 1 }
    approved_by { "null" }
    post { create(:postnew) }
  end
end