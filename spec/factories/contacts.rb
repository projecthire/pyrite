require 'faker'

FactoryGirl.define do
  factory :contact do |f|
    f.full_name { Faker::Name.name }
    f.first_name { Faker::Name.first_name }
    f.last_name { Faker::Name.last_name }
  end
end
