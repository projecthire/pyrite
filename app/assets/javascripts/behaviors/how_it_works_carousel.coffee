textFor = (index) ->
  $(".how-it-works-carousel [data-swiper-slide-index=#{index}]").data('text')

setSlideHeight = (swiper) ->
  $container = $(swiper.container)
  $activeSlide = $(swiper.container).find ".swiper-slide-active"

  $container.addClass('notransition')
  cachedHeight = $container.css('height')
  $container.css('height', '')
  targetHeight = $activeSlide[0].scrollHeight  + 50
  $container.css('height', cachedHeight)

  setTimeout ->
    $container.removeClass('notransition')
    $container.css
      'height': targetHeight
  , 1

class @.HowItWorksCarousel
  @initialize: ->
    $('.how-it-works-carousel').each ->
      swiper = new Swiper this,
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
            "<h4>#{text}</h4>" +
          "</div>"
        hashnav: true
        speed: 500
        onSlideChangeStart: setSlideHeight

      $(window).on 'resize', ->
        setSlideHeight(swiper)

$ ->
  HowItWorksCarousel.initialize()
