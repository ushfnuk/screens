# Создаем пространство имен, если это не было сделано ранее
window.App = {} unless App?

class App.Post extends Backbone.Model
    defaults: ->
        date: new Date()
        title: 'Post title'
        text: 'Post text'
        type: 'post'

    initialize: ->

    url: ->
        return "#{App.Settings.URL}/posts"
