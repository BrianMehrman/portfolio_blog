FactoryGirl.define do
  factory :comment do
    guest_name {Faker::HipsterIpsum.words.join(' ')}
    content {Faker::HipsterIpsum.words.join(' ')}
  end
end
