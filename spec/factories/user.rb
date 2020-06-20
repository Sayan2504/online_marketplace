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

  factory :admin, class: User do
    name { "Someone" }
    email { "admin@gmail.com" }
    password { "11111111" }
    admin { true }
  end
end