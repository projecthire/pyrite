feature "Guest views hello world page" do
  scenario "sees hello world text" do
    visit root_path

    expect(page).to have_text I18n.t "home.hello_world"
  end
end
