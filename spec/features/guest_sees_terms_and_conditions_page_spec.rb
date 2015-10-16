feature 'Guest sees terms and conditions page' do
  scenario "reads terms and conditions" do
    visit root_path
    click_link "Terms + Conditions"
    expect(page).to have_content ('TERMS OF SERVICE')
  end
end