require 'faker'

FactoryGirl.define do
  factory :candidate do |f|
    f.email { Faker::Internet.email }
  end
end
