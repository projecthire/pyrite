require 'faker'

FactoryGirl.define do
  factory :contact do |f|
    f.name { Faker::Name.name }
    f.first_name { Faker::Name.first_name }
    f.last_name { Faker::Name.last_name }
    f.email { Faker::Internet.email }
  end
end
