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
    balance BigDecimal.new("0.0")
    user nil
  end

  factory :transaction do
    account nil
    operation_id 1
    operation_type "MyString"
  end

  factory :credit do
    account nil
    amount { BigDecimal.new("0.0") }
  end

  factory :debit do
    account nil
    amount { BigDecimal.new("0.0") }
  end
end
