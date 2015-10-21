textFor = (index) ->
  $(".faq-carousel [data-swiper-slide-index=#{index}]").data('text')


class @.FAQCarousel
  @initialize: ->
    $('.faq-carousel').each ->
      swiper = new Swiper '.faq-carousel',
        autoresize: true
        cube:
          slideShadows: false
          shadow: false
        loop: true
        pagination: '.faq-steps .faq-circles'
        paginationClickable: true
        paginationBulletRender: (index, className) ->
          text = textFor(index)
          "<div class='group-circle-holder #{className}'>" +
            "<a class='group-circle' id='#group_{index}'>#{text}</a>" +
            "</div>"
        hashnav: true
        speed: 500

$ ->
  FAQCarousel.initialize()
