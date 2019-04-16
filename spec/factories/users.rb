FactoryBot.define do
  factory :user do
    _account = Faker::Internet.username
    name { Faker::Name.name }
    sequence(:account) { |n| "#{_account}_#{n}" }
    sequence(:email) { |n| Faker::Internet.email("#{_account}_#{n}") }

    trait :with_user_detail do
      association :user_detail, factory: :user_detail
    end
  end
end
