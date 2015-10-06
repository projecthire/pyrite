feature 'Candidate registers' do
  scenario 'via candidate landing page' do
    visit root_path
    click_button 'navbar_candidate_signup_btn'

    # first step of funnel
    expect(current_path).to eq(registration_wizard_path(:personal))

    fill_in "candidate[name]", with: Faker::Name.name
    fill_in "candidate[email]", with: Faker::Internet.email

    click_button "Continue"

    # second step of funnel
    expect(current_path).to eq(registration_wizard_path(:professional))

    select 'mba_student', from: 'candidate[current_profession]'
    select '3-5', from: 'candidate[years_experience]'
    select 'hedge_fund', from: 'candidate[desired_profession]'
    select 'london', from: 'candidate[desired_location]'
    select 'us_citizen', from: 'candidate[work_status]'

    password = Faker::Internet.password 8
    fill_in "candidate[password]", with: password
    fill_in "candidate[password_confirmation]", with: password

    click_button "Continue"

    # third step of funnel
    expect(current_path).to eq(registration_wizard_path(:authorize))

    click_button "authorize_linkedin"

    # candidate dashboard
    expect(current_path).to eq(candidate_dashboard_path)
  end
end
