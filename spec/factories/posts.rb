FactoryGirl.define do   
  factory :post do 
    title { Faker::Lorem.sentence }
    body { Faker::Internet.url}
  end
end
