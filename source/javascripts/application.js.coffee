#= require jquery
#= require ScrollMagic/js/_dependent/greensock/TweenMax.min
#= require ScrollMagic/js/_examples/modernizr.custom.min
#= require ScrollMagic
#= require ScrollMagic/js/jquery.scrollmagic.debug

tween = new TimelineMax().add([
  TweenMax.to(".mario", 1,
    left: 50
    ease: Circ.easeIn
  )
  TweenMax.to(".mario", 1,
    top: -60
    ease: Circ.easeOut
  )
]).add([
  TweenMax.to(".mario", 1,
    top: 0
    ease: Circ.easeIn
  )
  TweenMax.to(".mario", 1,
    left: 70
    ease: Circ.easeOut
  )
]).add(TweenMax.to(".goomba", 0.5,
  scaleY: 0.1
  "margin-top": 93
  "margin-bottom": 7
  ease: Circ.easeIn
), 1.5)

# init controller
controller = new ScrollMagic(container: "#example-wrapper")

# build scene
scene = new ScrollScene(
  triggerElement: "#trigger"
  duration: 300
).setTween(tween).addTo(controller)

# show indicators (requires debug extension)
scene.addIndicators()
