FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'test12345' }
    admin { Faker::Boolean.boolean }
  end
end
