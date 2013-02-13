Spine = require('spine')

class StartController extends Spine.Controller
  className: "start_controller screen"

  elements:
    '#start': 'start'

  events:
    'click #start': 'transitionToBuildSnitchController'

  constructor: ->
    super
    @html require('views/start_controller')

  transitionToBuildSnitchController: (e) ->
    e.preventDefault() if @isActive()
    whiteNoiseController = @stack["WhiteNoiseController"]
    whiteNoiseController.transitionTo = "BuildSnitchController"
    whiteNoiseController.active()

module.exports = StartController
