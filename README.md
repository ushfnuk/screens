# Screens

Редактор экранов со встроенным API

## Установка

1. Скачиваем репозиторий и пероходим в рабочую папку:

    ~~~~~ bash
    $ git clone git@github.com:ushfnuk/screens.git
    $ cd screens
    ~~~~~

2. Устанавливаем необходимые для проекта зависимости:

    ~~~~~ bash
    $ npm install
    ~~~~~

3. Устанавливаем настройки по умолчанию:

    ~~~~~ bash
    $ ./setapi -h

      Usage: setapi [options]

      Options:

        -h, --help                 output usage information
        -V, --version              output the version number
        -a, --api [path]           Set path to API server
        -c, --config [path]        Set path to config file
        -p, --port [number]        Set local server port number to config file
        -d, --docco [number]       Set docco server port number to config file
        -b, --build-port [number]  Set build port number to config file

    $ ./setapi

    config.json saved!
    ~~~~~

4. Компилируем всё необходимое для работы проекта и запускаем локальный сервер:

    ~~~~~ bash
    $ grunt compile
    $ grunt server

    Running "server:app" (server) task
    Server started at
     => http://localhost:4000
    ~~~~~

5. В бразуре проект доступен [по адресу](http://localhost:4000).
