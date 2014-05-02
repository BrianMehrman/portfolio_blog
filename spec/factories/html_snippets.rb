FactoryGirl.define do
  factory :html_snippet do
    name {Faker::HipsterIpsum.words.join(' ')}
    description {Faker::Lorem.sentences}
    html {Faker::HTMLIpsum.body}
    css "p {background:#d24f5f;}"

    created_at {Faker::Time.date}
    updated_at {Faker::Time.date}

    image_file_name {Faker::Name}
    image_content_type {Faker::Name}
    image_file_size {1024}
    image_updated_at {Faker::Time.date}

    trait :with_js do
      javascript ""
    end
  end
end
