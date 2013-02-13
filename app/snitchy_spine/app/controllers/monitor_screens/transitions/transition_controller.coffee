Spine = require('spine')

class TransitionController extends Spine.Controller
  constructor: ->
    super
    @active @setTimerToToggleNextScreen

  setTimerToToggleNextScreen: ->
    setTimeout(@activateNextScreen, 4000)
    #TODO: Is this too long?

  activateNextScreen: =>
    throw "This must be defined in a subclass"

  activate: ->
    @sound.load()
    @sound.play()
    super

  deactivate: ->
    if @isActive()
      @sound.stop()
    super

module.exports = TransitionController
