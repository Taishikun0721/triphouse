FactoryBot.define do
  factory :place do
      sequence(:id) { |n| "#{n}" }
      name {"this is a test place"}
      image_url {"https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRWbjBvnDGpAgUlVOozY2E9NLrH0iJRujHu0OQuEAtO02dbyGdk&usqp=CAU"}
      description {"first description"}
      area {"japan"}
  end
end
