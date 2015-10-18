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
    swiper = new Swiper '.how-it-works-carousel',
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
      onSlideChangeStart: setSlideHeight

    $(window).on 'resize', ->
      setSlideHeight(swiper)


$ ->
  HowItWorksCarousel.initialize()
