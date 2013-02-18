require('lib/setup')

Spine             = require('spine')
MonitorController = require('controllers/monitor_controller')

class Snitchy extends Spine.Controller
  constructor: ->
    super
    @append new MonitorController()
    @append "<div id='player'></div>"

module.exports = Snitchy
