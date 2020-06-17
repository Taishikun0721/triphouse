FactoryBot.define do
  factory :place_area do
    sequence(:id, &:to_s)
    area_name { 'asia' }
  end
end
