
# Начало всего
$ ->
    # Активируем сортируемый элемент
    $('.jsList').sortable
        connectWith: '.jsList'
        items: '.jsListItem'
        placeholder: 'bPlaceholder'
        forcePlaceholderSize: true
        cursor: 'move'
        opacity: .5

    .disableSelection()
