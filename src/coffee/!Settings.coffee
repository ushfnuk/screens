# Создаем пространство имен, если это не было сделано ранее
window.App = {} unless App?

App.Settings =
    # URL берем из `config.json`
    URL: "{{= vars.API_URL }}"
