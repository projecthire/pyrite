require 'faker'

feature 'Employer Contact' do
  scenario 'Employer Contacts Us via Employer Contact Form' do
    visit employer_landing_path
    within(:css, '#hero') do
      click t "marketing.employer_landing.hero.button"
    end
    expect(current_path).to eq(new_employer_contact_path)

    expect(page).to have_text t("marketing.employer_contact.sub_heading.text")

    name = Faker::Name.name
    fill_in 'employer_contact[name]', with: name
    fill_in 'employer_contact[company]', with: Faker::Company.name
    fill_in 'employer_contact[email]', with: Faker::Internet.email(name)
    fill_in 'employer_contact[message]', with: Faker::Lorem.paragraph

    within(:css, '#new_employer_contact') do
      click_button t "marketing.employer_contact.button"
    end

    expect(page).to have_text t("marketing.employer_contact.success")
  end
end
