feature 'Guest registers via coming soon page' do
  scenario 'should confirm that their valid email has been registered', :js do
    visit new_contact_path
    fill_in "contact[name]", with: "P.T. Barnum"
    fill_in "contact[email]", with: "pt@barnum.com"
    click_button I18n.t "coming_soon.form.submit.text"
    expect(page).to have_text I18n.t "coming_soon.form.state.email.success"
  end

  scenario 'should not allow form to be submitted with invalid inputs', :js do
    visit new_contact_path
    fill_in "contact[name]", with: "P.T. Barnum"
    fill_in "contact[email]", with: "pt@bar."
    click_button I18n.t "coming_soon.form.submit.text"
    expect(page).not_to have_text I18n.t "coming_soon.form.state.email.success"
  end

  scenario 'should not allow form to be submitted twice', :js do
    visit new_contact_path
    fill_in "contact[name]", with: "P.T. Barnum"
    fill_in "contact[email]", with: "pt@barnum.com"
    click_button I18n.t "coming_soon.form.submit.text"
    expect(page).to have_css "input[type=submit][disabled=disabled]"
  end

  scenario 'should not allow same email to register twice', :js do
    visit new_contact_path
    fill_in "contact[name]", with: "P.T. Barnum"
    fill_in "contact[email]", with: "pt@barnum.com"
    click_button I18n.t "coming_soon.form.submit.text"

    visit new_contact_path
    fill_in "contact[name]", with: "P.T. Barnum"
    fill_in "contact[email]", with: "pt@barnum.com"
    click_button I18n.t "coming_soon.form.submit.text"

    expect(page).to have_text I18n.t "coming_soon.form.state.email.errors.duplicate"
  end
end
