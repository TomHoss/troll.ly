Spine = require('spine')

class ShowSnitchController extends Spine.Controller
  className: "show_snitch_controller screen"

  elements:
    "#slides": "slides"

  constructor: ->
    super
    @html require("views/show_snitch_controller")
    @active @showHashFragment
    @active @showSnitch
    Spine.bind "YoutubeLinkSet", =>
      @buildPlayer()

  #DISCUSS: Play static noise when page is initally loaded?
  #TODO:  Possibly use navigate and a callback to activate this controller, (would currently be weird with the transition beforehand).  This navigate should really be used to activate this controller, rather than being done after the fact.
  showHashFragment: ->
    @navigate("/#{Spine.snitch.id}")

  showSnitch: ->
    #block until player is ready to play
    #    setTimeout(-> console.log "waiting", 100) until @hiddenYouTube.playerReady

    @rotateSlides()
    Spine.player.unMute()
    Spine.player.playVideo()
    console.log "show the snitch"

  buildPlayer: ->
    #FIXME: Remove these Spine variables and use controller properties
    Spine.player = new YT.Player 'player',
      videoId: Spine.snitch.youTubeID()
      events:
        onReady: @onPlayerReady

  onPlayerReady: =>
    #@playerReady = true

    #This is done to eager load the video
    #This is not preloading as much as it used to

    #seems like large works but small doens't - maybe it only works for certain videos
    #Spine.player.setPlaybackQuality("small")

    Spine.player.mute()
    Spine.player.playVideo()
    setTimeout ( ->
      console.log "Time"
      Spine.player.pauseVideo()), 5000

    #different videos take different amount of times to load
    #can't really preload it
    #it's indeterminate
    #--
    #now they aren't even muting or pausing ?? wtf?
    #Can I inspect the postMessage request and response? for mute etc?

    eagerLoadAsMuchAsPossible = @eagerLoadAsMuchAsPossible.bind this
    @dataFetcher = setInterval(eagerLoadAsMuchAsPossible, 500)

  eagerLoadAsMuchAsPossible: ->
    currentFractionLoaded = Spine.player.getVideoLoadedFraction()
    console.log currentFractionLoaded
    playerHasStoppedFetching = (Spine.oldFractionLoaded == currentFractionLoaded) && currentFractionLoaded != 0

    if playerHasStoppedFetching
      clearInterval @dataFetcher

    Spine.oldFractionLoaded = currentFractionLoaded

  rotateSlides: ->
    for image_url in Spine.snitch.slides
      @el.append "<img src='#{image_url}'>"

    count = 0
    slides = @el.find("img")
    slides.hide()
    $(slides[0]).show()

    setInterval (->
      slides.hide()
      count++
      index = count % slides.length
      $(slides[index]).show()
    ), 2000
module.exports = ShowSnitchController
