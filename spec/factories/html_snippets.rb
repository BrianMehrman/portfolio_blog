FactoryGirl.define do 
  factory :html_snippet do
    name {Faker::HipsterIpsum.words.join(' ')}
    description {Faker::Lorem.sentences}
    html {Faker::HTMLIpsum.body}
    css "p {background:#d24f5f;}"

    created_at {Faker::Time.date}
    updated_at {Faker::Time.date}

    trait :with_image do
      image { File.new(Rails.root.join('spec','assets','images','BuildingRender_01.jpeg'))}
    end

    trait :with_js do
      javascript ""
    end
  end
end