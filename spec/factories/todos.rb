FactoryBot.define do
  factory :todo do
    title { Faker::Lorem.word }
    created_by { Faker::Date.between(2.days.ago, Date.today) }
  end
end
