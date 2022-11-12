# Modulo 8 - Aprendizaje esperado 04

Aplicar procedimiento de despliegue de un aplicativo web Ruby on Rails utilizando Heroku para disponibilizarlo en internet.

## Requisitos

1. Configurar nuestro Gemfile y config/database.yml para poder publicar el proyecto de nuestro blog a Heroku.
2. Cuando el proyecto se encuentre disponible en internet, ejecutar la migración para generar los artículos utilizando la gema de Faker.
3. Ingresar un artículo utilizando el formulario generado anteriormente Para evitar mostrar el error 404, colocar la ruta /articulos como root

### Procesos

Configurar nuestro Gemfile y config/database.yml para poder publicar el proyecto de nuestro blog a Heroku.

Agregar la gema de postgresql al Gemfile en el grupo de producción.

```ruby
group :production do
  gem 'pg'
end
```

Ejecutar el comando bundle install para instalar la gema de postgresql.

```bash
bundle install
```

Agregar la configuración de la base de datos en config/database.yml

```yml
production:
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  database: rails_tweet_adalid_production
  username: rails_tweet_adalid
  password: <%= ENV['RAILS_TWEET_ADALID_DATABASE_PASSWORD'] %>
```

Hacemos un commit con el código generado

```bash
git add .
git commit -m "Configuración de la base de datos para producción"
```

Subimos el código a github

```bash
git push origin main
```

Crear el proyecto en Heroku ejecutando en la terminal

```bash
heroku create
```

Publicar el proyecto a Heroku

```bash
git push heroku main
```

Cuando el proyecto se encuentre disponible en internet, ejecutar la migración para generar los artículos utilizando la gema de Faker.

Ejecutar la migración en Heroku

```bash
heroku run rails db:migrate
```

Ejecutar la generación de artículos en Heroku

```bash
heroku run rails db:seed
```

Tambien puedes ingresar a la consola de rails en heroku por ejemplo crea un artículo utilizando el formulario generado anteriormente ingresando en la consola de rails de Heroku

```bash
heroku run rails console
```

```ruby
Article.create(title: 'Titulo', content: 'Contenido', published: true)
```
