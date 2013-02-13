Spine                = require('spine')
TransitionController = require('controllers/monitor_screens/transitions/transition_controller')

class WhiteNoiseController extends TransitionController
  className: "white_noise_controller screen"

  constructor: ->
    super
    @html require('views/white_noise_controller')

    @sound = new buzz.sound "/sounds/white_noise",
      formats: ["mp3", "ogg"]

  activateNextScreen: =>
    @stack[@transitionTo].active()

module.exports = WhiteNoiseController
