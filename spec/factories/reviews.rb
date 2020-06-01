FactoryBot.define do
  factory :review do
      sequence(:review) {|n| "This is a test review#{n}"}
      association :user
      association :place
  end
end
