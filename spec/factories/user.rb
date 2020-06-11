FactoryBot.define do
  factory :user, aliases: [:user1, :user2, :user3] do
    name { "Someone" }
    email  { "someone@gmail.com" }
    password { "11111111" }
  end
end