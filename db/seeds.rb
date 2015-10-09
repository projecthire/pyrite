# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

Admin.create!(email: 'admin@projecthire.com', password: 'pr0j3ctH1r3', password_confirmation: 'pr0j3ctH1r3')

DesiredProfession.create!(name: 'Hedge Fund')
DesiredProfession.create!(name: 'Private Equity')
DesiredProfession.create!(name: 'Other')

DesiredLocation.create!(name: 'New York City')
DesiredLocation.create!(name: 'London')
DesiredLocation.create!(name: 'Chicago')
DesiredLocation.create!(name: 'San Francisco')
DesiredLocation.create!(name: 'Hong Kong')
DesiredLocation.create!(name: 'Boston')
