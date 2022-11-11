# Modulo 8 - Aprendizaje esperado 05

Construir una aplicación web que disponibiliza un servicio web utilizando la arquitectura Rest para la creación de modificación de recursos de una entidad acorde a un requerimiento especificado

## Requisitos

1. Evitar que los doscientos artículos se vean en la vista de /blog del proyecto utilizando la paginación con la gema Kaminari.
2. Completar el CRUD de artículos basándose en las 8 rutas y 7 acciones para que los artículos se puedan Crear, Leer, Editar y Eliminar.

### Procesos

Durante las clases aprendimos como crear un CRUD de forma manual, sin embargo, en este aprendizaje esperado vamos a utilizar el scaffold para crear el CRUD de artículos.

Crear un CRUD haciendo uso del comando `rails generate scaffold` y completar las rutas y acciones necesarias para que el CRUD funcione correctamente.

```bash
rails generate scaffold Tweet title:string content:text published:boolean
```

Ejecutar las migraciones para crear la tabla en la base de datos.

```bash
rails db:migrate
```

Generar 200 artículos con contenido al azar utilizando el archivo db/seeds.rb y la gema Faker:

```ruby
# db/seeds.rb
require 'faker'

Tweet.destroy_all

puts 'Creating 200 fake tweets...'

200.times do
  Tweet.create(
    title: Faker::Book.title,
    content: Faker::Lorem.paragraph,
    published: Faker::Boolean.boolean
  )
end
```

Correr el archivo seeds.rb:

```bash
rails db:seed
```

Agregar la gema Kaminari para la paginación.

```ruby
gem 'kaminari'
```

Ejecutar el comando `bundle install` para instalar la gema.

```bash
bundle install
```

Agregar la paginación en el controlador de artículos.

```ruby
class TweetsController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /tweets
  # GET /tweets.json
  def index
    @tweeets = Tweet.page(params[:page])
  end
end
```

Agregar la paginación en la vista index de tweets.

```erb
<%= paginate @tweets %>
```

Hacemos un commit con el código generado

```bash
git add .
git commit -m "Agregar paginación con Kaminari"
```

Recuerda publicar los cambios del proyecto a Heroku

```bash
git push heroku main
```

Ejecutar la migración en Heroku

```bash
heroku run rails db:migrate
```

Ejecutar la generación de teewts usando el archivo seed en Heroku

```bash
heroku run rails db:seed
```
