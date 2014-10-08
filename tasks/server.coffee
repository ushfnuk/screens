express = require 'express'
app     = express()


module.exports = (grunt)->
    grunt.registerMultiTask 'server', ->
        config = grunt.util._.extend
            port: 3000
            root: './'
        , @data

        done = @async()

        app.use express.static config.root
        app.listen config.port

        grunt.log.writeln 'Server started at\n => http://localhost:' + config.port
