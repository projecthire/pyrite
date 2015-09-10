feature 'Guest registers via coming soon page' do
  scenario 'should confirm that their email has been registered', :js do
    visit root_path
    fill_in "contact[name]", :with => "P.T. Barnum"
    fill_in "contact[email]", :with => "pt@barnum.com"
    click_button I18n.t "coming_soon.form.submit.text"
    expect(page).to have_text I18n.t "coming_soon.form.state.email.success"
  end
end
