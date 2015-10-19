include ActionView::Helpers::SanitizeHelper

feature 'Guest sees FAQ page' do
  context "from the nav link" do
    scenario "arrives at FAQ page from navigation" do
      visit root_path
      click_on('navbar_faq')
      expect(page).to have_content ("Frequently Asked Questions")
    end
    scenario "sees four sections of faq tabs" do
      visit '/faq'
      expect(page).to have_text('SIGN UP')
      expect(page).to have_text('SUBMIT')
      expect(page).to have_text('SUCCEED')
      expect(page).to have_text('GET HIRED')
    end
  end
end
