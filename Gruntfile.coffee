module.exports = (grunt)->

    grunt.initConfig
        pkg: grunt.file.readJSON 'package.json'
        cfg: grunt.file.readJSON 'config.json'

        coffee:
            app:
                files: [
                    expand: true
                    cwd: './src/coffee/'
                    src: ['**/*.coffee']
                    dest: './src/js/'
                    ext: '.js'
                    extDot: 'last'
                ]

        concat:
            js:
                src: ['./libs/jquery.js', './libs/jquery-ui.js', './libs/backbone.js', './libs/bootstrap.js', './src/js/**/*.js']
                dest: './static/js/global.js'

            less:
                src: ['./src/css/**/*.css']
                dest: './static/css/global.css'

        docco:
            app:
                src: './src/coffee/**/*.coffee'
                options:
                    output: 'docs/'

        less:
            app:
                options:
                    paths: ['./src/css']
                    cleancss: true

                files:
                    './src/css/global.css': './src/less/**/*.less'

        clean:
            js: ['./static/js/global.js', './src/js/**/*.js']
            less: ['src/css/**/*.css', '!src/css/*.min.css', './static/css/global.css']
            jade: './*.html'
            docco: './docs/*'
            build: './dist/*'


        watch:
            coffee:
                files: './src/coffee/**/*.coffee'
                tasks: ['clean:js', 'coffee:app', 'setapi:app', 'concat:js', 'docco:app']

            less:
                files: './src/less/**/*.less'
                tasks: ['clean:less', 'less:app', 'concat:less']

            jade:
                files: './src/jade/**/*.jade'
                tasks: ['clean:jade', 'jade:app']

        copy:
            app:
                src: ['./index.html', './static/**']
                dest: './dist/'


        jade:
            app:
                options:
                    pretty: true

                files:  [
                    expand: true
                    cwd: './src/jade/'
                    src: ['**/*.jade']
                    dest: '.'
                    ext: '.html'
                    extDot: 'last'
                ]

        server:
            app:
                port: '<%= pkg.vars.SERVER_PORT %>'
                root: './'

            docco:
                port: '<%= pkg.vars.DOCCO_PORT %>'
                root: './docs'

            dist:
                port: '<%= pkg.vars.BUILD_PORT %>'
                root: './dist'

        setapi:
            app:
                files: [
                    expand: true
                    cwd: './src/js/'
                    src: ['./**/*.js']
                    extDot: 'last'
                ]


    pkg = grunt.util._.extend grunt.config.get('pkg'), vars: grunt.config.get('cfg')
    grunt.config.set 'pkg', pkg

    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-less'
    grunt.loadNpmTasks 'grunt-contrib-concat'
    grunt.loadNpmTasks 'grunt-contrib-clean'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-contrib-copy'
    grunt.loadNpmTasks 'grunt-contrib-jade'
    grunt.loadNpmTasks 'grunt-docco'
    grunt.loadTasks 'tasks'

    grunt.registerTask 'compile', ['clean', 'jade', 'coffee', 'less', 'setapi', 'concat', 'docco']
    grunt.registerTask 'build', ['compile', 'copy']
