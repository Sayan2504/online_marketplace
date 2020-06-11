FactoryBot.define do
  factory :user, aliases: [:buyer1, :buyer2, :buyer3, :post1, :post2, :post3, :post_review1, :post_review2, :post_review3] do
    name { "Someone" }
    email  { "someone@gmail.com" }
    password { "11111111" }
  end
end