FactoryGirl.define do 
  factory :category do
    name {Faker::HipsterIpsum.words.join(' ')}
  end
end