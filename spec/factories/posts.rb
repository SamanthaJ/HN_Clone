FactoryGirl.define do   
  factory :post do 
    title { Faker::Lorem.sentence }
    link { Faker::Internet.url }
  end
end
