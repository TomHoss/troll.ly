Spine  = require('spine')
Snitch = require('models/snitch')

class BuildSnitchController extends Spine.Controller
  className: "build_snitch_controller screen"

  events:
    "click #build_snitch_next": "transitionToYoutubeLinkController"

  elements:
    "#build_snitch_next": "next"
    "#slides"           : "slides"

  constructor: ->
    super
    Spine.snitch = Snitch.create({}, {ajax: false})
    #TODO: Refactor to set this id in the constructor
    Spine.snitch.changeID(Spine.snitch.generateQuickGuid())
    @html require("views/build_snitch_controller")
    @el.fileupload
      url: "/api/v1/snitches/#{Spine.snitch.id}/slides"
      dataType: 'json'
      done: -> console.log("Uploaded")
      add: @add
      fail: (e, data) -> console.log JSON.parse(data.jqXHR.responseText).error
      start: @fakeUploadProgress

  add: (e, data) =>
    data.submit() #Uploads to server
    @addThumbnail(data)
    @next.show()

  addThumbnail: (data) =>
    reader = new FileReader()
    reader.onload = (oFREvent) =>
      data_url = oFREvent.target.result
      @slides.append "<div class='slide-container'><img src='#{data_url}' class='thumb'></div>"
      Spine.snitch.slides.push data_url

    for file in data.files
      reader.readAsDataURL(file)

  fakeUploadProgress: (e) =>
    e.preventDefault()
    @stack["UploadingController"].active()

  transitionToYoutubeLinkController: (e) =>
    e.preventDefault()
    whiteNoiseController = @stack["WhiteNoiseController"]
    whiteNoiseController.transitionTo = "YoutubeLinkController"
    whiteNoiseController.active()

module.exports = BuildSnitchController
