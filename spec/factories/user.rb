FactoryBot.define do
  factory :user1, class: User do
    name { "Someone" }
    email { "someone@gmail.com" }
    password { "11111111" }
  end

  factory :user2, class: User do
    name { "Someone" }
    email { "someonenew@gmail.com" }
    password { "11111111" }
  end

  factory :user3, class: User do
    name { "Someone" }
    email { "someone2@gmail.com" }
    password { "11111111" }
  end

  factory :user4, class: User do
    name { "Someone" }
    email { "someone5@gmail.com" }
    password { "11111111" }
  end

  factory :admin, class: User do
    name { "Someone" }
    email { "admin@gmail.com" }
    password { "11111111" }
    admin { true }
    buyer_post_id { 1 }
  end
end