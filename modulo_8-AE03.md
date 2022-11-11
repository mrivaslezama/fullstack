# Modulo 8 - Aprendizaje esperado 03

Construir un aplicativo utilizando formularios para almacenar datos en una base de datos de acuerdo a los requerimientos de la organización

## Requisitos

Vamos a generar un modelo utilizando la línea de comando según la siguiente tabla:

|     | Articles  |         |
| --- | --------- | ------- |
| PK  | id        | integer |
|     | title     | string  |
|     | content   | string  |
|     | published | boolean |

1. Generar 200 artículos con contenido al azar utilizando el archivo db/seeds.rb y la gema Faker:

2. Definir 2 vistas y 3 acciones que hagan lo siguiente:

| Metodo | Ruta          | Funcion                                                |
| ------ | ------------- | ------------------------------------------------------ |
| GET    | articles      | Mostrar todos los artículos en la base de datos        |
| GET    | articles/new  | Mostrar el formulario para registrar un artículo       |
| POST   | articles/form | Capturar los datos del formulario y almacenarlos en BD |

### Procesos

Generar el modelo y la migración de la tabla Articles:

```bash
rails g model Article title:string content:string published:boolean
```

Ejecutar la migración:

```bash
rails db:migrate
```

Agregar la gema Faker al archivo Gemfile:

```ruby
gem 'faker'
```

Generar 200 artículos con contenido al azar utilizando el archivo db/seeds.rb y la gema Faker:

```ruby
# db/seeds.rb
require 'faker'

Article.destroy_all

puts 'Creating 200 fake articles...'

200.times do
  Article.create(
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

Crear el controlador Articles:

```bash
rails g controller Articles
```

Crear las vistas:

```bash
touch app/views/articles/index.html.erb
touch app/views/articles/new.html.erb
```

Configurar las rutas:

```ruby
# config/routes.rb
Rails.application.routes.draw do
  get 'articles', to: 'articles#index'
  get 'articles/new', to: 'articles#new'
  post 'articles/form', to: 'articles#create'
end
```

Crear las acciones:

```ruby
# app/controllers/articles_controller.rb
class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
  end

  def create
    Article.create(
      title: params[:title],
      content: params[:content],
      published: params[:published]
    )
    redirect_to articles_path
  end
end
```

Crear la vista index.html.erb:

```erb
<!-- app/views/articles/index.html.erb -->
<h1>Articles</h1>
<%= link_to "New Article", articles_new_path %>
<% @articles.each do |article| %>
  <p>
    <strong>Title:</strong>
    <%= article.title %>
  </p>
  <p>
    <strong>Content:</strong>
    <%= article.content %>
  </p>
  <p>
    <strong>Published:</strong>
    <%= article.published %>
  </p>
  <hr>
<% end %>
```

Crear el formulario:

```erb
<!-- app/views/articles/new.html.erb -->
<h1>Crear un nuevo artículo</h1>

<%= form_with url: articles_path, local: true do |form| %>
  <p>
    <%= form.label :title %><br>
    <%= form.text_field :title %>
  </p>

  <p>
    <%= form.label :content %><br>
    <%= form.text_area :content %>
  </p>

  <p>
    <%= form.label :published %><br>
    <%= form.check_box :published %>
  </p>

  <p>
    <%= form.submit %>
  </p>
<% end %>

Hacemos un commit con el código generado

```bash
git add .
git commit -m "Agregando estilos iniciales"
```

Subimos el código a github

```bash
git push origin main
```
