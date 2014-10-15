class App.ListItemView extends Backbone.View
    tagName: 'a'
    className: 'list-group-item jsListItem'

    events: {}
        # 'click .jsItemClose': 'destroy'

    initialize: ->
        @listenTo @model, 'change', @render, @
        @listenTo @model, 'remove', @remove, @
        @listenTo @model, 'render', @render, @

    # TODO: заменить на Jade шаблон
    template: """
        <h4 class="list-group-item-heading"></h4>
        <p class="list-group-item-text"></p>
    """

    # Рендерим вьюху
    render: ->
        data = @model.toJSON()

        # на основе данных модели
        @$el.html _.template @template, data

        # Аттрибуты элемента устанавливаем вручную иначе при перерисовке данные не будут отображены
        @$el.attr 'id', "listItem#{data.id}"
        @$el.attr 'data-id', data.id
        @$el.attr 'data-type', data.type

        return @

    # Нажали на крестик конкретного анонса
    destroy: ->
        @model.remove()


class App.ListItemsView extends Backbone.View
    className: 'list-group jsList'

    initialize: ->
        @listenTo @collection, 'add', @addOne, @


    addOne: (model)->
        view = new App.ListItemView model: model
        @$el.append view.render().el
