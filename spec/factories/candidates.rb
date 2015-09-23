require 'faker'

FactoryGirl.define do
  factory :candidate do |f|
    f.name { Faker::Name.name }
    f.email { Faker::Internet.email }
    f.password { Faker::Internet.password 8 }
  end

  factory :confirmed_candidate, parent: :candidate do
    after(:create) { |candidate| candidate.confirm }
  end
end
