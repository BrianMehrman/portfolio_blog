
FactoryGirl.define do 
  factory :medium do
    name {Faker::HipsterIpsum.words.join(' ')}
    description {Faker::Lorem.sentences}

    created_at {Faker::Time.date}
    updated_at {Faker::Time.date}

    trait :with_image do
      
      media_type "image"
      file {File.new(Rails.root.join('spec','assets','images','BuildingRender_01.jpeg'))}
    end
  end
end