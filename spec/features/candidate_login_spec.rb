feature 'Candidate login' do
  scenario 'confirmed candidate can login', :js do
    candidate = create(:confirmed_candidate)

    visit new_candidate_session_path
    fill_in "candidate[email]", with: candidate.email
    fill_in "candidate[password]", with: candidate.password
    click_button "new_candidate_session_submit_btn"

    expect(current_path).to eq(root_path)
  end
end
