# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

 
$ ->

  $(window).load ->
    $('#flexiselDemo1').flexisel
      visibleItems: 4
      itemsToScroll: 3
      animationSpeed: 200
      infinite: true
      navigationTargetSelector: null
      autoPlay:
        enable: false
        interval: 5000
        pauseOnHover: true
      responsiveBreakpoints:
        portrait:
          changePoint: 480
          visibleItems: 1
          itemsToScroll: 1
        landscape:
          changePoint: 640
          visibleItems: 2
          itemsToScroll: 2
        tablet:
          changePoint: 768
          visibleItems: 3
          itemsToScroll: 3
      loaded: (object) ->
        console.log 'Slider loaded...'
        return
      before: (object) ->
        console.log 'Before transition...'
        return
      after: (object) ->
        console.log 'After transition...'
        return
    return

