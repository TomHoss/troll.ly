Spine                = require('spine')
TransitionController = require('controllers/monitor_screens/transitions/transition_controller')

class UploadingController extends TransitionController
  className: "uploading_controller screen"

  #TODO:  Remove progress div and apply those styles to uploading_controller
  elements:
    "#progress #text": "progress"

  constructor: ->
    super
    @html require('views/uploading_controller')
    #TODO: Refactor to have everything inherit with this pattern
    #TODO: Technically this should block until the sound is ready to play, else it's racy
    @sound = new buzz.sound "/sounds/uploading",
      formats: ["mp3", "ogg"]

  activate: ->
    @counter = setInterval(@incrementCount(), 30)
    super

  deactivate: ->
    clearInterval(@counter)
    super

  incrementCount: =>
    count = 0
    =>
      count++
      #TODO: The increments should be exactly distributed over the interal and the next line not needed if done correctly, although it's kinda cool that it hangs on 100...
      @progress.text(count) unless count > 100

  activateNextScreen: =>
    @stack["BuildSnitchController"].active()

module.exports = UploadingController
