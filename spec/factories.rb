FactoryGirl.define do
  sequence(:email) { |n| "example_user_#{n}@example.com" }
  sequence(:name) { |n| "Example User #{n}" }

  factory :user do
    email
    name
    password "examplepass"

    trait :has_account do
      association(:account)
    end

    factory :user_with_account, traits: [:has_account]
  end

  factory :account do
    balance { BigDecimal.new("0.0") }
    user nil
  end
end
