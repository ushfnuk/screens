
module.exports = (grunt)->
    grunt.registerMultiTask 'setapi', 'Устанивливаем настройки из config.json', ->
        for file in @filesSrc
            fileContent = grunt.file.read file

            resultContent = grunt.util._.template fileContent, grunt.config.get('pkg'),
                evaluate: /\{\{([\s\S]+?)\}\}/g
                interpolate: /\{\{=([\s\S]+?)\}\}/g
                escape: /\{\{-([\s\S]+?)\}\}/g

            grunt.file.write file, resultContent

            grunt.log.ok "Переменные из config.json успешно подставлены в #{file}"
