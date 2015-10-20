require 'faker'

FactoryGirl.define do
  factory :employer_contact do |f|
    f.name { Faker::Name.name }
    f.first_name { Faker::Name.first_name }
    f.last_name { Faker::Name.last_name }
    f.company { Faker::Company.name }
    f.email { Faker::Internet.email }
    f.message { Faker::Lorem.paragraph }
  end
end
