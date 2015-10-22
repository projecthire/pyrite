textFor = (index) ->
  $(".how-it-works-carousel [data-swiper-slide-index=#{index}]").data('text')


class @.HowItWorksCarousel
  @initialize: ->
    $('.how-it-works-carousel').each ->
      swiper = new Swiper this,
        autoresize: true
        cube:
          slideShadows: false
          shadow: false
        loop: true
        pagination: '.how-it-works-steps .how-it-works-circles'
        paginationClickable: true
        paginationBulletRender: (index, className) ->
          text = textFor(index)
          "<div class='step-circle-holder #{className}'>" +
            "<a class='step-circle-warning'>#{index+1}</a>" +
            "<h4>#{text}</h4>" +
          "</div>"
        hashnav: true
        speed: 500

$ ->
  HowItWorksCarousel.initialize()
