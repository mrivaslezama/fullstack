# Modulo 8 - Aprendizaje esperado 03

Aplicar procedimiento de despliegue de un aplicativo web Ruby on Rails utilizando Heroku para disponibilizarlo en internet.

## Requisitos

1. Configurar nuestro Gemfile y config/database.yml para poder publicar el proyecto de nuestro blog a Heroku.
2. Cuando el proyecto se encuentre disponible en internet, ejecutar la migración para generar los artículos utilizando la gema de Faker.
3. Ingresar un artículo utilizando el formulario generado anteriormente Para evitar mostrar el error 404, colocar la ruta /articulos como root

### Procesos

Configurar nuestro Gemfile y config/database.yml para poder publicar el proyecto de nuestro blog a Heroku.

Agregar la gema de postgresql al Gemfile, movemos la gema sqlite3 al grupo de desarrollo y test.

```ruby
group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
end
```

Ejecutar el comando bundle install para instalar la gema de postgresql.

```bash
bundle install
```

Agregar la configuración de la base de datos en config/database.yml

```yml
production:
  <<: *default
  database: blog_production
  username: blog
  password: <%= ENV['BLOG_DATABASE_PASSWORD'] %>
```

Crear la base de datos en Heroku

```bash
heroku create
heroku addons:create heroku-postgresql:hobby-dev
```

4. Configurar la variable de entorno de la base de datos

```bash
heroku config:set BLOG_DATABASE_PASSWORD=123456
```

5. Publicar el proyecto a Heroku

```bash
git push heroku master
```

Cuando el proyecto se encuentre disponible en internet, ejecutar la migración para generar los artículos utilizando la gema de Faker.

1. Ejecutar la migración en Heroku

```bash
heroku run rake db:migrate
```

2. Ejecutar la tarea para generar los artículos

```bash
heroku run rake db:seed
```

Ingresar un artículo utilizando el formulario generado anteriormente Para evitar mostrar el error 404, colocar la ruta /articulos como root

1. Crear un nuevo artículo en Heroku

```bash
heroku run rails console
```

```ruby
Article.create(title: 'Nuevo artículo', body: 'Este es el cuerpo del artículo')
```

2. Colocar la ruta /articulos como root

```ruby
root 'articles#index'
```



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
