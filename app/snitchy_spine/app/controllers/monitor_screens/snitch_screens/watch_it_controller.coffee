Spine = require('spine')

class WatchItController extends Spine.Controller
  className: "watch_it_controller screen"

  events:
    "click #watch_it": "transitionToShowSnitchController"

  constructor: ->
    super
    @html require('views/watch_it_controller')

  #TODO: DRY these
  transitionToShowSnitchController: (e) =>
    e.preventDefault()
    whiteNoiseController = @stack["WhiteNoiseController"]
    whiteNoiseController.transitionTo = "ShowSnitchController"
    whiteNoiseController.active()

module.exports = WatchItController
