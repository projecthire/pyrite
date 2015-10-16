include ActionView::Helpers::SanitizeHelper

feature "Guest visits 'How it works' page" do
  context "from the nav link" do
    scenario "sees carousel text about how it works" do
      visit root_path

      click_on "HOW IT WORKS"

      expect(current_path).to eq how_it_works_path

      expect(page.html).to include t("pages.how_it_works.fade_carousel.content_1")
      expect(page.html).to include t("pages.how_it_works.fade_carousel.content_2")

      expect(page.html).to include t("pages.how_it_works.carousel.step_1.heading")
      expect(page.html).to include t("pages.how_it_works.carousel.step_1.body_html")

      expect(page.html).to include t("pages.how_it_works.carousel.step_2.heading")
      expect(page.html).to include t("pages.how_it_works.carousel.step_2.body_html")

      expect(page.html).to include t("pages.how_it_works.carousel.step_3.heading")
      expect(page.html).to include t("pages.how_it_works.carousel.step_3.body_html")

      expect(page.html).to include t("pages.how_it_works.carousel.step_4.heading")
      expect(page.html).to include t("pages.how_it_works.carousel.step_4.body_html")
    end
  end

  context "via link to a specific step from the home page" do
    scenario "sees the step that they clicked on", :js do
      visit root_path

      find_link("2").click
      expected_result = strip_tags t("pages.how_it_works.carousel.step_2.body_html")

      within ".how-it-works-carousel .swiper-slide-active" do
        expect(page).to have_content expected_result
      end
    end
  end
end
