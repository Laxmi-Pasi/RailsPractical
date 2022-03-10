FactoryBot.define do
  factory :myproduct do
    association :myuser 
    name  { "toy car" }
    price { Faker::Number.between(from: 1, to: 50) }
  end
end

FactoryBot.define do
  factory :myuser do
    role  { "admin" }
    email { Faker::Internet.email }
    #email { "lp@gmail.com"}
    password { Faker::Internet.password }
  end
end