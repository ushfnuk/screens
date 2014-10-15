# Создаем пространство имен, если это не было сделано ранее
window.App = {} unless App?

# Модель для загрузки заметок
class App.Note extends Backbone.Model
    defaults: ->
        date: new Date()
        title: 'Note title'
        text: 'Note text'
        type: 'note'

    url: ->
        return "#{App.Settings.URL}/notes"

    parse: (data)->

    # Удаляем себя из коллекции (если нужно)
    removeFromCollection: ->
        @collection?.remove @



# Коллекция заметок и их загрузка
class App.Notes extends Backbone.Collection
    model: App.Note

    url: ->
        return "#{App.Settings.URL}/notes"

    parse: (data)->
