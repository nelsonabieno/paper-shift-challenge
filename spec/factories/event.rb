FactoryBot.define do
  factory :event do
    starts_at { Time.now }
    ends_at { Time.now + 5 }
  end
end
