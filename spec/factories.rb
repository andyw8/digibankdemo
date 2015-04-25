FactoryGirl.define do
  sequence(:email) { |n| "example_user_#{n}@example.com" }
  sequence(:name) { |n| "Example User #{n}" }

  factory :user do
    email
    name
    password "examplepass"
  end

  factory :account do
    user nil
  end
end
