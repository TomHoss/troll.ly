Spine                   = require('spine')
MonitorScreenController = require('/controllers/monitor_screen_controller')

class MonitorController extends Spine.Controller
  className: "monitor"

  events:
    'click #about_link': 'activateAbout'
    'click #feedback_link': 'activateFeedback'
    'click #snitchy_link': 'activateStart'

  constructor: ->
    super
    @html require("views/monitor_controller")
    @monitor_screen_controller = new MonitorScreenController()
    @append @monitor_screen_controller

  #TODO: DRY these
  activateAbout: (e) ->
    e.preventDefault()
    @monitor_screen_controller.AboutController.active()

  activateFeedback: (e) ->
    e.preventDefault()
    @monitor_screen_controller.FeedbackController.active()

  activateStart: (e) ->
    #TODO: Extract this into a separate stack so that the user will not lose snitch state when clicking about
    e.preventDefault()
    @monitor_screen_controller.StartController.active()

module.exports = MonitorController
