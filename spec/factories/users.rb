FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length = 6) }
    password_confirmation { |u| u.password }
  end
end
