feature 'Candidate registration' do
  scenario 'should allow a candidate to register', :js do
    visit new_candidate_registration_path
    fill_in "candidate[name]", with: Faker::Name.name
    fill_in "candidate[email]", with: Faker::Internet.email
    password = Faker::Internet.password 8
    fill_in "candidate[password]", with: password
    fill_in "candidate[password_confirmation]", with: password
    click_button "new_candidate_registration_submit_btn"

    expect(Candidate.count == 1)
  end

  # @TODO: candidate confirms new registration

  scenario 'should allow a confirmed candidate to login', :js do
    candidate = create(:confirmed_candidate)

    visit new_candidate_session_path
    fill_in "candidate[email]", with: candidate.email
    fill_in "candidate[password]", with: candidate.password
    click_button "new_candidate_session_submit_btn"

    expect(current_path == "/")
  end
end
