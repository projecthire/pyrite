textFor = (index) ->
  $(".faq-carousel [data-swiper-slide-index=#{index}]").data('text')

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


class @.FAQCarousel
  @initialize: ->
    swiper = new Swiper '.faq-carousel',
      cube:
        slideShadows: false
        shadow: false
      loop: true
      pagination: '.faq-steps .faq-circles'
      paginationClickable: true
      paginationBulletRender: (index, className) ->
        text = textFor(index)
        "<div class='group-circle-holder #{className}'>" +
          "<a class='group-circle' id='#{text}_link'>#{text}</a>" +
          "</div>"
      hashnav: true
      speed: 500
      onSlideChangeStart: setSlideHeight

    $(window).on 'resize', ->
      setSlideHeight(swiper)


$ ->
  FAQCarousel.initialize()