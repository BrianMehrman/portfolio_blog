
FactoryGirl.define do
  factory :medium do
    name {Faker::HipsterIpsum.words.join(' ')}
    description {Faker::Lorem.sentences}

    created_at {Faker::Time.date}
    updated_at {Faker::Time.date}
    image_file_name {Faker::Name}
    image_content_type {Faker::Name}
    image_file_size {1024}
    image_updated_at {Faker::Time.date}
  end
end
