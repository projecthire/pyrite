feature "Guest visits 'How it works' page" do
  context "from the nav link" do
    scenario "sees carousel text about how it works" do
      visit root_path

      click_on "HOW IT WORKS"

      expect(current_path).to eq how_it_works_path

      expect(page).to have_text t("pages.how_it_works.fade_carousel.content_1")
      expect(page).to have_text t("pages.how_it_works.fade_carousel.content_2")

      expect(page).to have_text t("pages.how_it_works.how_it_works.step_1.heading")
      expect(page).to have_text t("pages.how_it_works.how_it_works.step_1.body")

      expect(page).to have_text t("pages.how_it_works.how_it_works.step_2.heading")
      expect(page).to have_text t("pages.how_it_works.how_it_works.step_2.body")

      expect(page).to have_text t("pages.how_it_works.how_it_works.step_3.heading")
      expect(page).to have_text t("pages.how_it_works.how_it_works.step_3.body")

      expect(page).to have_text t("pages.how_it_works.how_it_works.step_4.heading")
      expect(page).to have_text t("pages.how_it_works.how_it_works.step_4.body")
    end
  end
end
