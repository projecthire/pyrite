require 'faker'

FactoryGirl.define do
  factory :employer do |f|
    f.email { Faker::Internet.email }
  end
end
