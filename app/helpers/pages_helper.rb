module PagesHelper
  def text_for(index)
    I18n.t "pages.how_it_works.carousel.step_#{index}.heading"
  end
end

