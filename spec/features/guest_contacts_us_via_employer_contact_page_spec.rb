require 'faker'

feature 'Employer Contact' do
  before(:all) do
    @employer_contact = build(:employer_contact)
  end

  scenario 'Employer Contacts Us via Employer Contact Form' do
    visit employers_landing_path
    within(:css, '#hero') do
      click_button t "marketing.employer_landing.hero.button"
    end
    expect(current_path).to eq(new_employer_contact_path)

    expect(page).to have_text t("marketing.employer_contact.sub_heading.text")

    fill_in 'employer_contact[name]', with: @employer_contact.name
    fill_in 'employer_contact[company]', with: @employer_contact.company
    fill_in 'employer_contact[email]', with: @employer_contact.email
    fill_in 'employer_contact[message]', with: @employer_contact.message

    within(:css, '#new_employer_contact') do
      click_button t "marketing.employer_contact.button"
    end

    expect(page).to have_text t("marketing.employer_contact.success")
  end
end
