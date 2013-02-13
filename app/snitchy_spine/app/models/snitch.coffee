Spine = require('spine')

class Snitch extends Spine.Model
  @configure 'Snitch', 'youtube_url'

  @extend Spine.Model.Ajax

  @url: "/api/v1/snitches"

  constructor: ->
    super
    @slides = []

  #NOTE:  This will not suffice with mass scale
  generateQuickGuid: ->
    Math.random().toString(36).substring(2, 15) +
    Math.random().toString(36).substring(2, 15)

  youTubeID: ->
    @youtube_url.match(/v=(.*)&?/)[1]

module.exports = Snitch
