Spine = require('spine')

class FeedbackController extends Spine.Controller
  className: "feedback_controller screen"

  constructor: ->
    super
    @html require('views/feedback_controller')

module.exports = FeedbackController
