textFor = (index) ->
  $(".how-it-works-carousel [data-swiper-slide-index=#{index}]").data('text')

class @.HowItWorksCarousel
  @initialize: ->
    new Swiper '.how-it-works-carousel',
      cube:
        slideShadows: false
        shadow: false
      loop: true
      pagination: '.how-it-works-steps .how-it-works-circles'
      paginationClickable: true
      paginationBulletRender: (index, className) ->
        text = textFor(index)
        "<div class='step-circle-holder #{className}'>" +
          "<a class='step-circle'>#{index+1}</a>" +
          "<div>#{text}</div>" +
        "</div>"
      hashnav: true
      speed: 500

$ ->
  HowItWorksCarousel.initialize()
