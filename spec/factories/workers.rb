FactoryGirl.define do
  factory :worker do
    email Faker::Internet.email
    password Faker::Internet.password
  end
end
