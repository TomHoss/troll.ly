Spine = require('spine')

class AboutController extends Spine.Controller
  className: "about_controller screen"

  elements:
    "#about1": "about1"
    "#about2": "about2"

  constructor: ->
    super
    @html require('views/about_controller')
    @active @startToggler

  startToggler: ->
    @toggler = setInterval @toggleViews, 2000

  toggleViews: =>
    @about1.toggle()
    @about2.toggle()

  deactivate: ->
    clearInterval(@toggler)
    @about1.show()
    @about2.hide()
    super

module.exports = AboutController
