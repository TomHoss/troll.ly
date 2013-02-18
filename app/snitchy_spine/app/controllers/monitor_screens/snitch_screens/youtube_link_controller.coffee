Spine = require('spine')

class YoutubeLinkController extends Spine.Controller
  className: "youtube_link_controller screen"

  #TODO: Fire events when they hit enter as well
  events:
    "click .next": "transitionAndUpload"

  elements:
    '#youtube_input': "youtubeInput"

  constructor: ->
    super
    @html require('views/youtube_link_controller')
    @insertYouTubeAPIScript()
    onYouTubeIframeAPIReady = @onYouTubeIframeAPIReady.bind this
    window.onYouTubeIframeAPIReady = onYouTubeIframeAPIReady

  transitionAndUpload: (e) =>
    e.preventDefault()
    youtube_url = @youtubeInput.val()
    Spine.snitch.updateAttributes({youtube_url: youtube_url})
    Spine.trigger "YoutubeLinkSet"
    @transitionToWatchItController()

  transitionToWatchItController: =>
    whiteNoiseController = @stack["WhiteNoiseController"]
    whiteNoiseController.transitionTo = "WatchItController"
    whiteNoiseController.active()

  insertYouTubeAPIScript: ->
    tag = document.createElement('script')
    tag.src = "//www.youtube.com/iframe_api"
    firstScriptTag = document.getElementsByTagName('script')[0]
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag)

  onYouTubeIframeAPIReady: ->
    #TODO:  What to do if youtube is down?  Cache JS file?
    @youtubeInput.attr("placeholder", "Paste a Youtube link here.")
    @youtubeInput.attr("disabled", false)

module.exports = YoutubeLinkController
