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
rails generate scaffold Category name:string
```

Creamos la migración para agregar la relación entre los modelos.

```bash
rails generate migration AddCategoryToTweet category:references
```

Corremos la migración para crear la columna en la tabla de tweets.

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

Antes de correr la migración, recomiendo

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
