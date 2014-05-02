FactoryGirl.define do
  factory :attachment do
    slug_name {Faker::HipsterIpsum.words.join(' ')}
    created_at {Faker::Time.date}
    updated_at {Faker::Time.date}

    trait :with_html_snippet do
      association :attachable, factory: :html_snippet
    end

    trait :with_image do
      association :attachable, factory: [:medium, :with_image]
    end

    trait :with_flash do

    end
  end
end
