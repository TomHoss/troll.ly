AppServer = require 'strata'
Hem       = require 'hem'
path      = require 'path'
root      = path.resolve("./public")
Snitchy   = new Hem()

AppServer.use(AppServer.commonLogger)
AppServer.use(AppServer.file, root, 'index.html')
AppServer.use(AppServer.contentType, 'application/json')
AppServer.use(AppServer.contentLength)

AppServer.get '/application.css', Snitchy.cssPackage().createServer()
AppServer.get '/application.js', Snitchy.hemPackage().createServer()

AppServer.post "/api/v1/snitches/:id/slides", (env, callback) ->
  AppServer.Response("", {}, 201).send(callback)

AppServer.put "/api/v1/snitches/:id", (env, callback) ->
  AppServer.Response("", {}, 200).send(callback)

AppServer.run({ port: 9295 })
