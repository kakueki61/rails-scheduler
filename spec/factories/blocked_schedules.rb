FactoryGirl.define do
  factory :blocked_schedule do
    association :schedule, strategy: :create
    association :shop, strategy: :create
    start_at { Date.today + 11.hours }
    end_at { Date.today + 13.hours }
  end
end
