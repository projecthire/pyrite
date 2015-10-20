feature 'Candidate registration wizard' do
  before(:all) do
    @desired_professions = []
    @desired_locations = []
    @desired_professions << create(:desired_profession, name: 'Hedge Fund')
    @desired_professions << create(:desired_profession, name: 'Private Equity')
    @desired_locations << create(:desired_location, name: 'New York City')
    @desired_locations << create(:desired_location, name: 'London')
    @desired_locations << create(:desired_location, name: 'San Francisco')
  end

  scenario 'Candidate begins wizard' do
    given_a_guest_is_at_landing_page
    when_they_click_sign_up_button
    then_they_see_first_step_of_wizard
  end

  scenario 'Candidate completes first step of wizard' do
    given_a_guest_is_at_first_step_of_wizard
    when_they_enter_their_name_and_email
    and_click_continue
    then_they_see_second_step_of_the_funnel
  end

  scenario 'Candidate completes second step of wizard' do
    given_a_candidate_has_completed_first_step
    when_they_select_the_professional_options_best_describing_themselves
    and_they_choose_and_confirm_a_password
    and_see_terms_and_conditions_text
    and_click_continue
    then_they_see_final_step_of_funnel
  end

  scenario 'Candidate completes third (and final) step of wizard' do
    given_a_candidate_has_completed_steps_one_and_two
    when_they_click_authorize_linkedin_button
    then_they_see_their_candidate_dashboard
  end

  scenario 'Candidate cancels LinkedIn authorization' do
    given_a_candidate_has_completed_steps_one_and_two
    when_they_fail_linkedin_authorization
    then_they_see_the_authorize_step_of_funnel
  end

  def given_a_guest_is_at_landing_page
    visit root_path
  end

  def when_they_click_sign_up_button
    click_button 'Sign up'
  end

  def then_they_see_first_step_of_wizard
    expect(current_path).to eq(candidates_registration_wizard_path(:personal))
  end

  def given_a_guest_is_at_first_step_of_wizard
    given_a_guest_is_at_landing_page
    when_they_click_sign_up_button
  end

  def when_they_enter_their_name_and_email
    fill_in "candidate[name]", with: Faker::Name.name
    fill_in "candidate[email]", with: Faker::Internet.email
  end

  def and_click_continue
    click_button "Continue"
  end

  def then_they_see_second_step_of_the_funnel
    expect(current_path).to eq(candidates_registration_wizard_path(:professional))
  end

  def given_a_candidate_has_completed_first_step
    given_a_guest_is_at_first_step_of_wizard
    when_they_enter_their_name_and_email
    and_click_continue
  end

  def when_they_select_the_professional_options_best_describing_themselves
    select 'MBA Student', from: 'candidate[current_profession]'
    select '3-5', from: 'candidate[years_experience]'

    check "candidate_desired_profession_ids_#{@desired_professions[0].id}"
    check "candidate_desired_profession_ids_#{@desired_professions[1].id}"

    check "candidate_desired_location_ids_#{@desired_locations[0].id}"
    check "candidate_desired_location_ids_#{@desired_locations[1].id}"
    check "candidate_desired_location_ids_#{@desired_locations[2].id}"

    select 'US Citizen', from: 'candidate[work_status]'
  end

  def and_see_terms_and_conditions_text
    expect(page).to have_text t "marketing.candidate_registration_wizard.professional_step.terms_and_conditions.label"
    expect(page).to have_css "a[href='#{terms_path}']"
  end

  def and_they_choose_and_confirm_a_password
    password = Faker::Internet.password 8
    fill_in "candidate[password]", with: password
    fill_in "candidate[password_confirmation]", with: password
  end

  def then_they_see_final_step_of_funnel
    expect(current_path).to eq(candidates_registration_wizard_path(:authorize))
  end

  def given_a_candidate_has_completed_steps_one_and_two
    given_a_candidate_has_completed_first_step
    when_they_select_the_professional_options_best_describing_themselves
    and_they_choose_and_confirm_a_password
    and_click_continue
  end

  def when_they_click_authorize_linkedin_button
    mock_auth_hash :linkedin
    click_button "authorize_linkedin"
  end

  def when_they_fail_linkedin_authorization
    mock_auth_failure :linkedin
    click_button "authorize_linkedin"
  end

  def then_they_see_their_candidate_dashboard
    expect(current_path).to eq(new_candidate_session_path)
  end

  def then_they_see_the_authorize_step_of_funnel
    expect(current_path).to eq(candidates_registration_wizard_path(id: :authorize))
  end
end
