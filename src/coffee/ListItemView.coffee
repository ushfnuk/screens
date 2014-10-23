class App.ListItemView extends Backbone.View
    tagName: 'a'
    className: 'list-group-item jsListItem'
    # TODO: заменить на Jade шаблон
    template: """
        <h4 class="list-group-item-heading">
            <%= title %>
            <button class="close jsListItemClose" type="button">
                <span aria-hidden="true">&times;</span>
                <span class="sr-only">Close</span>
            </button>
        </h4>
        <p class="list-group-item-text"><%= text %></p>
    """


    events:
        'click .jsItemClose': 'destroy'

    initialize: ->
        @listenTo @model, 'change', @render, @
        @listenTo @model, 'remove', @remove, @
        @listenTo @model, 'render', @render, @

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
    options:
        connectWith: '.jsList'
        items: '.jsListItem'
        placeholder: 'bPlaceholder'
        forcePlaceholderSize: true
        cursor: 'move'
        opacity: .5

    className: 'col-md-6 well'
    template: """
        <div class="list-group jsList"></div>
    """

    initialize: ->
        @$el.html @template
        @$list = @$('.jsList')
        @list = @$list[0]

        @$list.sortable(@options).disableSelection()
        @listenTo @collection, 'add', @addOne, @


    addOne: (model)->
        view = new App.ListItemView model: model
        @$list.append view.render().el

    render: ->
        @collection.each @addOne, @



class App.ListOfListItemsView extends Backbone.View
    className: 'row jsListWrapper'
    initialize: ->
        @listenTo @collection, 'add', @addOne, @


    addOne: (collection)->
        view = new App.ListItemsView collection: collection
        @$el.append view.render().el
