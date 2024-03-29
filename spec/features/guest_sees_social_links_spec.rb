feature 'Guest sees social links' do
  scenario "observes social links" do
    visit root_path
    expect(page).to have_css "a[href='https://facebook.com/social.projecthire']"
    expect(page).to have_css "a[href='https://twitter.com/ProjectHireInc']"
    expect(page).to have_css "a[href='https://www.linkedin.com/company/projecthire']"
  end
end