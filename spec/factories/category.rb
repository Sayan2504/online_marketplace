FactoryBot.define do
  factory :category, aliases: [:category1, :category2] do
    name { "Someone" }
  end

  factory :categorynew, class: Category do
    name { "Someone again" }
  end
end