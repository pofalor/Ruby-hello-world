# Ruby Hello World

Учебное веб-приложение на Ruby on Rails, которое выводит приветствие **«¡Hola, mundo!»** на главной странице.

## Стек

- **Ruby** 3.4.6
- **Rails** ~> 8.0.2
- **SQLite** — база данных
- **Puma** — веб-сервер
- **Propshaft** — asset pipeline
- **Hotwire** (Turbo + Stimulus) и **Import Maps** — фронтенд
- **Solid Cache / Solid Queue / Solid Cable** — кеш, фоновые задачи и Action Cable на базе БД
- **Kamal** + **Docker** — деплой

## Требования

- Ruby 3.4.6 (см. `.ruby-version`)
- Bundler

## Установка и запуск

```bash
# Клонировать репозиторий
git clone https://github.com/pofalor/Ruby-hello-world.git
cd Ruby-hello-world

# Установить зависимости
bundle install

# Подготовить базу данных
bin/rails db:prepare

# Запустить сервер
bin/rails server
```

Приложение будет доступно по адресу <http://localhost:3000> — на главной странице отобразится «¡Hola, mundo!».

## Как это работает

Корневой маршрут (`config/routes.rb`) указывает на действие `hello` контроллера `ApplicationController`, которое рендерит приветствие:

```ruby
# config/routes.rb
root "application#hello"
```

```ruby
# app/controllers/application_controller.rb
def hello
  render html: "¡Hola, mundo!"
end
```

## Тесты и проверка кода

```bash
# Запуск тестов
bin/rails test

# Статический анализ безопасности
bin/brakeman

# Проверка стиля кода (RuboCop, omakase-конфигурация Rails)
bin/rubocop
```

## Деплой

Проект подготовлен к деплою через [Kamal](https://kamal-deploy.org) в Docker-контейнере:

- `Dockerfile` — production-образ приложения;
- `config/deploy.yml` — конфигурация Kamal (серверы, реестр образов, SSL через Let's Encrypt).

```bash
bin/kamal setup    # первичная настройка серверов
bin/kamal deploy   # деплой новой версии
```

Перед деплоем укажите свои значения в `config/deploy.yml` (адреса серверов, имя образа, реестр).
