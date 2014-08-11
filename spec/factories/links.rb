# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link do |l|
    l.url { Faker::Internet.url }
    l.private false

    l.trait :with_user do
      user
    end

    factory :link_with_user, traits: [:with_user]
  end
end
