FactoryBot.define do
  factory :user, aliases: [:user1, :user2, :user3] do
    name { "Someone" }
    email { "someone@gmail.com" }
    password { "11111111" }
  end

  factory :usernew, aliases: [:admin2], class: User do
    name { "Someone" }
    email { "someonenew@gmail.com" }
    password { "11111111" }
  end

  factory :userduplicate, class: User do
    name { "Someone" }
    email { "someone2@gmail.com" }
    password { "11111111" }
  end

  factory :admin, aliases: [:user4], class: User do
    name { "Someone" }
    email { "admin@gmail.com" }
    password { "11111111" }
    admin { true }
    buyer_post_id { 1 }
  end

  factory :user5, class: User do
    name { "Someone" }
    email { "someone5@gmail.com" }
    password { "11111111" }
  end
end