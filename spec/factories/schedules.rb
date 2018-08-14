FactoryGirl.define do
  factory :schedule do
    association :worker, strategy: :create
    start_at { Date.today + 10.hours }
    end_at { Date.today + 18.hours }
  end
end
