FactoryGirl.define do
  factory :post do
    title {Faker::HipsterIpsum.words.join(' ')}
    description {Faker::Lorem.sentences}
    content {Faker::Lorem.paragraphs}
    # html {Faker::HTMLIpsum.body}
    # css "p {background:#d24f5f;}"

    trait :with_image do

    end

    trait :without_title do
      title ''
    end

    trait :without_description do
      description ''
    end

    trait :without_content do
      content ''
    end

    trait :as_draft do
      status_type_id 1
    end
  end
end
