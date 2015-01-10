#= require ScrollMagic/js/_dependent/greensock/TweenMax.min
#= require jquery
#= require ScrollMagic/js/_examples/modernizr.custom.min
#= require ScrollMagic
#= require ScrollMagic/js/jquery.scrollmagic.debug


duration = $(window).height()

# init controller
controller = new ScrollMagic(container: "#scroll-wrapper", globalSceneOptions: {triggerHook: "onLeave"})

new ScrollScene()
  .setPin("#sign-up")
  .addTo(controller)

new ScrollScene()
  .setPin("#festy-box-wrapper")
  .addTo(controller)

new ScrollScene()
  .setPin("#scroll-message")
  .addTo(controller)

scrollTween = new TimelineMax()
  .add([
    TweenMax.to("#scroll-message", 1.5, {'margin-top': "25vh", ease: Linear.easeNone})
  ])
  .add([
    # TweenMax.to("#starting-message", 1, {'opacity': '0', ease: Power0.easeNone})
    TweenMax.to("#scroll-message", 1, {'margin-top': "50vh", ease: Linear.easeNone})
    TweenMax.to("#scroll-message", 1, {'opacity': "0", ease: Linear.easeNone})
  ])
  # .add([
  #   TweenMax.to("#first-message", 1, {'opacity': '1', ease: Power0.easeNone})
  # ])


apparelTween = new TimelineMax()
  .add([
    TweenMax.to("#starting-message", .25, {'opacity': '0', ease: Power0.easeNone})
    TweenMax.to("#first-message", .25, {'opacity': '1', ease: Power0.easeNone})
    TweenMax.to("#slide-1 > .slide-content", 2, {'bottom': "150vh", ease: Linear.easeNone})
  ])
  .add([
    TweenMax.to("#slide-1 > .slide-content", 1, {'bottom': "100vh", ease: Linear.easeNone})
  ])

accesoriesTween = new TimelineMax()
  .add([
    TweenMax.to("#first-message", .25, {'opacity': '0', ease: Power0.easeNone})
    TweenMax.to("#second-message", .25, {'opacity': '1', ease: Power0.easeNone})
    TweenMax.to("#slide-2 > .slide-content", 2, {'bottom': "150vh", ease: Linear.easeNone})
  ])
  .add([
    TweenMax.to("#slide-2 > .slide-content", 1, {'bottom': "100vh", ease: Linear.easeNone})
  ])

artTween = new TimelineMax()
  .add([
    TweenMax.to("#second-message", .25, {'opacity': '0', ease: Power0.easeNone})
    TweenMax.to("#third-message", .25, {'opacity': '1', ease: Power0.easeNone})
    TweenMax.to("#slide-3 > .slide-content", 2, {'bottom': "150vh", ease: Linear.easeNone})
  ])
  .add([
    TweenMax.to("#slide-3 > .slide-content", 1, {'bottom': "100vh", ease: Linear.easeNone})
  ])


rainbowTween = new TimelineMax()
  .add([
    TweenMax.to("#third-message", .25, {'opacity': '0', ease: Power0.easeNone})
    TweenMax.to("#fourth-message", .25, {'opacity': '1', ease: Power0.easeNone})
    TweenMax.to("#slide-4 > .slide-content", 1, {'bottom': "300vh", ease: Linear.easeNone})
  ])
  .add([
    TweenMax.to("#slide-4 > .slide-content", 2, {'bottom': "300vh", ease: Linear.easeNone})
    TweenMax.to("#fourth-sub-message", .5, {'opacity': "1", ease: Power0.easeNone})
  ])
  .add([
    TweenMax.to("#slide-4 > .slide-content", 1, {'bottom': "200vh", ease: Linear.easeNone})
    TweenMax.to("#left-line", 1, {'transform': "rotate(-65deg)", 'left': '-125px', ease: Linear.easeNone})
    TweenMax.to("#right-line", 1, {'transform': "rotate(65deg)", 'right': '-125px', ease: Linear.easeNone})
  ])
  .add([
    TweenMax.to("#left-line", 1, {'transform': "rotate(0deg)", 'left': '-125px', ease: Linear.easeNone})
    TweenMax.to("#right-line", 1, {'transform': "rotate(0deg)", 'right': '-125px', ease: Linear.easeNone})
    TweenMax.to("#fourth-message", .25, {'opacity': '0', ease: Power0.easeNone})
    TweenMax.to("#fifth-message", .25, {'opacity': '1', ease: Power0.easeNone})
  ])

finalTween = new TimelineMax()
  .add([
    
    TweenMax.to("#slide-5 > .slide-content", .5, {'bottom': "400vh", ease: Linear.easeNone})
  ])
  .add([
    TweenMax.to("#slide-5 > .slide-content", 1, {'bottom': "360vh", ease: Linear.easeNone})
  ])
  .add([
    TweenMax.to("#mc_embed_signup_scroll", .2, {'transform': "scale(1.1)", ease: Linear.easeNone})
  ])
  .add([
    TweenMax.to("#mc_embed_signup_scroll", .2, {'transform': "scale(1)", ease: Linear.easeNone})
  ])
  .add([
    TweenMax.to("#slide-5 > .slide-content", .5, {'bottom': "360vh", ease: Linear.easeNone})
  ])
  .add([
    TweenMax.to("#slide-5 > .slide-content", .5, {'bottom': "360vh", ease: Linear.easeNone})
  ])

ua = navigator.userAgent.toLowerCase()
isAndroid = ua.indexOf("android") > -1

if isAndroid
  scrollScene = new ScrollScene({triggerElement: "#bottom-half", duration: 2*duration, offset: -400})
    .setTween(scrollTween)
    .addTo(controller)
    .addIndicators()

  apparelScene = new ScrollScene({triggerElement: "#slide-1", duration: 2*duration})
    .setPin("#slide-1", {pushFollowers: false})
    .setClassToggle("#slide-1 > .slide-content", "active")
    .setTween(apparelTween)
    .addTo(controller)
    .addIndicators()

  accesoriesScene = new ScrollScene({triggerElement: "#slide-2", duration: 2*duration})
    .setPin("#slide-2", {pushFollowers: false})
    .setClassToggle("#slide-2 > .slide-content", "active")
    .setTween(accesoriesTween)
    .addTo(controller)
    .addIndicators()

  artScene = new ScrollScene({triggerElement: "#slide-3", duration: 2*duration})
    .setPin("#slide-3", {pushFollowers: false})
    .setClassToggle("#slide-3 > .slide-content", "active")
    .setTween(artTween)
    .addTo(controller)
    .addIndicators()

  rainbowScene = new ScrollScene({triggerElement: "#slide-4", duration: 4*duration})
    .setPin("#slide-4", {pushFollowers: false})
    .setClassToggle("#slide-4 > .slide-content", "active")
    .setTween(rainbowTween)
    .addTo(controller)
    .addIndicators()


  finalScene = new ScrollScene({triggerElement: "#slide-5", duration: 4*duration})
    .setPin("#slide-5", {pushFollowers: false})
    .setClassToggle("#slide-5 > .slide-content", "active")
    .setTween(finalTween)
    .addTo(controller)
    .addIndicators()

else
  scrollScene = new ScrollScene({triggerElement: "#bottom-half", duration: 2*duration, offset: -400})
    .setTween(scrollTween)
    .addTo(controller)
    # .addIndicators()

  apparelScene = new ScrollScene({triggerElement: "#slide-1", duration: 2*duration})
    .setPin("#slide-1", {pushFollowers: false})
    .setClassToggle("#slide-1 > .slide-content", "active")
    .setTween(apparelTween)
    .addTo(controller)
    # .addIndicators()

  accesoriesScene = new ScrollScene({triggerElement: "#slide-2", duration: 2*duration})
    .setPin("#slide-2", {pushFollowers: false})
    .setClassToggle("#slide-2 > .slide-content", "active")
    .setTween(accesoriesTween)
    .addTo(controller)
    # .addIndicators()

  artScene = new ScrollScene({triggerElement: "#slide-3", duration: 2*duration})
    .setPin("#slide-3", {pushFollowers: false})
    .setClassToggle("#slide-3 > .slide-content", "active")
    .setTween(artTween)
    .addTo(controller)
    # .addIndicators()

  rainbowScene = new ScrollScene({triggerElement: "#slide-4", duration: 4*duration})
    .setPin("#slide-4", {pushFollowers: false})
    .setClassToggle("#slide-4 > .slide-content", "active")
    .setTween(rainbowTween)
    .addTo(controller)
    # .addIndicators()


  finalScene = new ScrollScene({triggerElement: "#slide-5", duration: 4*duration})
    .setPin("#slide-5", {pushFollowers: false})
    .setClassToggle("#slide-5 > .slide-content", "active")
    .setTween(finalTween)
    .addTo(controller)
    # .addIndicators()


# scene2.on 'leave', (e)->
#   console.log 'second scene leaves'
#   console.log e

# scene2.on 'enter', (e)->
#   console.log 'second scene enters'
#   console.log e

# rainbowScene.on 'enter', (e)->
#   console.log 'third scene enters'
#   console.log e

# rainbowScene.on 'leave', (e)->
#   console.log 'third scene leaves'
#   console.log e

# scene4.on 'enter', (e)->
#   # scene4.removePin(true)
#   console.log 'fourth scene enters'
#   console.log e
  
