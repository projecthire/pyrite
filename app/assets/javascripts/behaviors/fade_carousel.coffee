class @.FadeCarousel
  @initialize: ->
    new Swiper '.fade-carousel',
      autoplay: 5000
      autoplayDisableOnInteraction: false
      pagination: '.fade-carousel .swiper-pagination'
      effect: 'fade'
      fade:
        crossFade: true
      loop: true
      speed: 500

$ ->
  FadeCarousel.initialize()
