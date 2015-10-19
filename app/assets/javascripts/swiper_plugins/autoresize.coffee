setSlideHeight = (swiper) ->
  $container = $(swiper.container)
  $activeSlide = $(swiper.container).find ".swiper-slide-active"

  $container.addClass('notransition')
  cachedHeight = $container.css('height')
  $container.css('height', '')
  targetHeight = $activeSlide[0].scrollHeight
  $container.css('height', cachedHeight)

  setTimeout ->
    $container.removeClass('notransition')
    $container.css
      'height': targetHeight
  , 1

Swiper.prototype.plugins.autoresize = (swiper) ->
  if swiper.params.autoresize
    return {
      onSlideChangeStart: setSlideHeight
      onInit: ->
        $(window).on 'resize', ->
          setSlideHeight(swiper)
    }
