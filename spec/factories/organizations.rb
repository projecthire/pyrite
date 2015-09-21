require 'faker'

FactoryGirl.define do
  factory :organization do |f|
    f.name { Faker::Company.name }
  end
end
