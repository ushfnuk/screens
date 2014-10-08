
module.exports = (grunt)->
    grunt.registerMultiTask 'setapi', 'Устанивливаем настройки из config.json', ->
        for file in @files
            fileContent = grunt.file.read file.src[0]

            resultContent = grunt.util._.template fileContent, grunt.config.get('pkg'),
                evaluate: /\{\{([\s\S]+?)\}\}/g
                interpolate: /\{\{=([\s\S]+?)\}\}/g
                escape: /\{\{-([\s\S]+?)\}\}/g

            grunt.file.write file.src[0], resultContent

            grunt.log.ok "Переменные из config.json успешно подставлены в #{file.src[0]}"
