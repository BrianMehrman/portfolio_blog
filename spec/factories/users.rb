FactoryGirl.define do
  factory :user do

    name { Faker::Name.name }
    email { Faker::Internet.email }
    password "password"
    password_confirmation "password"

    trait :with_role do
      role_id rand{1..3}

    end
  end
end
