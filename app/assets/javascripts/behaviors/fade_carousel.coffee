class @.FadeCarousel
  @initialize: ->
    $('.fade-carousel').each ->
      new Swiper this,
        autoplay: 5000
        autoplayDisableOnInteraction: false
        pagination: '.fade-carousel .swiper-pagination'
        paginationClickable: true
        effect: 'fade'
        fade:
          crossFade: true
        loop: true
        speed: 500

$ ->
  FadeCarousel.initialize()
