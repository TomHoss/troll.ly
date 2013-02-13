Spine                 = require('spine')
StartController       = require('/controllers/monitor_screens/snitch_screens/start_controller')
WhiteNoiseController  = require('/controllers/monitor_screens/transitions/white_noise_controller')
BuildSnitchController = require('/controllers/monitor_screens/snitch_screens/build_snitch_controller')
YoutubeLinkController = require('/controllers/monitor_screens/snitch_screens/youtube_link_controller')
UploadingController   = require('/controllers/monitor_screens/transitions/uploading_controller')
WatchItController     = require('/controllers/monitor_screens/snitch_screens/watch_it_controller')
ShowSnitchController  = require('/controllers/monitor_screens/snitch_screens/show_snitch_controller')
AboutController       = require('/controllers/monitor_screens/monitor_button_screens/about_controller')
FeedbackController    = require('/controllers/monitor_screens/monitor_button_screens/feedback_controller')

class MonitorScreenController extends Spine.Stack
  className: "monitor_screen"

  controllers:
    "StartController": StartController
    "WhiteNoiseController": WhiteNoiseController
    "BuildSnitchController": BuildSnitchController
    "YoutubeLinkController": YoutubeLinkController
    "UploadingController": UploadingController
    "WatchItController": WatchItController
    "ShowSnitchController": ShowSnitchController #combine this with watchIt?
    "AboutController": AboutController
    "FeedbackController": FeedbackController

  constructor: ->
    super
    @WhiteNoiseController.sound.bind "canplaythrough", =>
      @StartController.start.show()

  default: "StartController"
module.exports = MonitorScreenController
