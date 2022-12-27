# Modulo 9 - Aprendizaje esperado 01

Implementar relaciones 1 a N en los modelos utilizando Ruby on Rails para satisfacer un requerimiento.

## Requisitos

1. Finalizar el DER con los campos necesarios.
2. Generar los modelos, migración y tablas en un proyecto de Rails.
3. Asociar los modelos entre publicaciones y etiquetas.
4. Generar el CRUD para publicaciones y etiquetas utilizando formularios anidados.

### Procesos

Previamente creamos un MVC (modelo, vista, controlador) llamado **Teew** usando el comando scaffold, este lo asociaremos a un nuevo modelo que llamaremos **Category**, esto lo haremos para poder generar una relación 1 a N entre los modelos.

```bash
rails generate model Category name:string
```

Creamos la migración para agregar la relación entre los modelos.

```bash
rails generate migration AddCategoryToTweet category:references
```

Si corremos la migración, nos dará un error, esto es porque creamos tweets anteriormente y estos deberian estar asociados a la llave foranea de la relación **1 a N**, para solucionar esto tenemos multiples opciones, pero por el momento solo borraremos los tweets que se encuentran en la base de datos, esto lo haremos desde la consola de rails o desde el archivo seeds.rb.

Abrimos la consola de rails

```bash
rails console
```

Ejecutamos el comando para eliminar todos los tweets.

```bash
Tweet.destroy_all
```

Corremos la migración para crear la columna category en la tabla de tweets.

```bash
rails db:migrate
```

Creamos la relación en el modelo Tweet.

```ruby
class Tweet < ApplicationRecord
  belongs_to :category
end
```

Creamos la relación en el modelo Category.

```ruby
class Category < ApplicationRecord
  has_many :tweets
end
```

Creamos la relación en el controlador de Tweets, esto lo hacemos para poder crear un nuevo tweet y asignarle una categoría. Debemos ir a los parámetros permitidos y agregar el parametro **category_id**.

```ruby
class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:title, :content, :published, :category_id)
    end
end
```

Debemos agregar category_id en el formulario de tweets. Quedara de la siguiente manera:

```erb
<%= form_with(model: tweet) do |form| %>
  <% if tweet.errors.any? %>
    <div style="color: red">
      <h2><%= pluralize(tweet.errors.count, "error") %> prohibited this tweet from being saved:</h2>
      <ul>
        <% tweet.errors.each do |error| %>
          <li><%= error.full_message %></li>
        <% end %>
      </ul>
    </div>
  <% end %>

  <div>
    <%= form.label :title, style: "display: block" %>
    <%= form.text_field :title %>
  </div>

  <div>
    <%= form.label :content, style: "display: block" %>
    <%= form.text_area :content %>
  </div>

  <div>
    <%= form.label :published, style: "display: block" %>
    <%= form.check_box :published %>
  </div>

  <div>
    <%= form.label :category_id, style: "display: block" %>
    <%= form.select :category_id, options_for_select(Category.all.map { |c| [c.name, c.id] }), {}, { class: 'form-control' } %>
  </div>

  <div>
    <%= form.submit %>
  </div>
<% end %>
```

Al correr el servidor y dirigirnos a los tweets notaremos que no se muestran las categorías en el formulario, esto es porque no hemos creado ninguna categoría, para crear una categoría debemos ir a la consola de rails y crear algunas categorías.

```bash
rails console
```

```ruby
Category.create(name: 'Ruby')
Category.create(name: 'Rails')
Category.create(name: 'Javascript')
Category.create(name: 'React')
Category.create(name: 'Vue')
Category.create(name: 'Angular')
Category.create(name: 'Python')
Category.create(name: 'Django')
Category.create(name: 'Flask')
Category.create(name: 'Java')
Category.create(name: 'Spring')
Category.create(name: 'Android')
Category.create(name: 'IOS')
Category.create(name: 'Swift')
Category.create(name: 'Kotlin')
Category.create(name: 'C#')
```

Esto podriamos hacerlo desde el archivo seeds.rb, pero por el momento lo dejaremos asi.

Ahora si podemos crear un nuevo tweet y asignarle una categoría.

Actualmente podemos seleccionar una categoría en el formulario de tweets, pero no se muestra en la vista de los tweets, para solucionar esto debemos modificar la vista de los tweets.

```erb
<div id="<%= dom_id tweet %>">
  <p>
    <strong>Title:</strong>
    <%= tweet.title %>
  </p>
  <p>
    <strong>Content:</strong>
    <%= tweet.content %>
  </p>
  <p>
    <strong>Category:</strong>
    <%= tweet.category.name %>
  </p>
  <p>
    <strong>Published:</strong>
    <%= tweet.published %>
  </p>
</div>
```

Ahora si podemos ver la categoría de cada tweet.

Hacemos un commit con el código generado

```bash
git add .
git commit -m "Agregar categoria a tweet"
```