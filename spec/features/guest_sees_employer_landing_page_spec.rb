feature 'Employer Landing Page' do
  scenario 'Guest visits employer landing page' do
    visit root_path
    click_link t "navbar.candidate_landing.to_employer_landing"
    expect(current_path).to eq(employer_landing_path)
  end

  # first section
  scenario 'Guest sees employer landing page hero section' do
    visit root_path
    click_link t "navbar.candidate_landing.to_employer_landing"
    expect(page).to have_text t "marketing.employer_landing.hero.heading"
  end

  # last section
  scenario 'Guest sees employer landing page join now section' do
    visit root_path
    click_link t "navbar.candidate_landing.to_employer_landing"
    expect(page).to have_text t "marketing.employer_landing.join_now.heading"
  end
end
