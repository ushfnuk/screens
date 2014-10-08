# Создаем пространство имен, если это не было сделано ранее
window.Screens = {} unless Screens?

Screens.Settings =
    # URL берем из `config.json`
    URL: "{{= vars.API_URL }}"
