express = require 'express'
app     = express()


module.exports = (grunt)->
    grunt.registerMultiTask 'server', ->
        config = @data

        done = @async()

        app.use express.static config.root
        app.listen config.port

        grunt.log.writeln 'Server started at\n => http://localhost:' + config.port
