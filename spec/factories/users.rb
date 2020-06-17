FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "gest#{n}@example.com" }
    password { 'password' }
  end
end
