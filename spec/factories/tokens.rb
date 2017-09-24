FactoryGirl.define do
  factory :token do
    expires_at "2017-09-23 23:07:56"
    association :user, factory: :user
  end
end
