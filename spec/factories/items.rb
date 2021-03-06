FactoryBot.define do
  factory :item do
    name { Faker::FunnyName.name }
    done { Faker::Boolean.boolean }
    todo { create(:todo) }
  end
end
