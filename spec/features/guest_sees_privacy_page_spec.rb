feature 'Guest sees privacy policy page' do
  scenario "accesses and reads privacy policy" do
    visit root_path
    click_link "Privacy Policy"
    expect(page).to have_content ('Project Hire, Incorporated – Privacy Policy')
    expect(page).to have_content ('be required by law.')
  end
end