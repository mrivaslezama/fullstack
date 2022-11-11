# Modulo 8 - Aprendizaje esperado 01

Aplicar procedimiento de creación de un proyecto nuevo en Ruby on Rails que incorpora las vistas y controladores utilizando la línea de comando, helpers y ayouts para dar solución a un requerimiento.

## Requisitos

1. Crear un nuevo proyecto en rails
2. Generar un controlador y dos vistas para el mismo, una para el inicio y otra para un formulario de contacto
3. En la vista de inicio ingresa tu información profesional a modo de hoja de vida como:
   - Nombre
   - Correo
   - Descripción de tu perfil, hobbies y pasiones
   - Últimos 2 trabajos o estudios
4. En la vista de contacto, generar un formulario de contacto que contenga los datos:
   - Nombre
   - Correo
   - Comentarios

### Procesos

Crear un proyecto nuevo en Ruby on Rails, utilizando la línea de comandos.

```bash
rails new nombre_proyecto
```

Ingresar al directorio del proyecto

```bash
cd nombre_proyecto
```

Crear un controlador llamado `pages` y dos vistas, una para el inicio y otra para el formulario de contacto

```bash
rails g controller pages home contact
```

Configurar las rutas y una ruta raiz por defecto

```ruby
# config/routes.rb
get '/home',        to: 'pages#home'
get '/contact',     to: 'pages#contact'
root 'pages#home'
```

Modificar el archivo `app/views/pages/home.html.erb` para agregar el contenido de la página, recuerda cambiar los datos por los tuyos.

```erb
# app/views/pages/home.html.erb
<hgroup>
  <!-- Nombre -->
  <h1>Brayan Diaz C</h1>
  <!-- Cargo -->
  <h2>Full Stack Developer | Coding | Teacher | Blogging</h2>
</hgroup>
<!-- Email -->
<a href="mailto:brayandiazc@gmail.com">brayandiazc@gmail.com</a>
<!-- Descripción de tu perfil, hobbies y pasiones -->
<p>Soy <strong>Full Stack Developer</strong>, con 4 años de experiencia, mi principal Stack tecnologico se basa en Ruby on Rails, PostgreSQL, AWS, React JS, React Native. Tengo experiencia en Python, NodeJS y sus tecnologías deribadas. Se que esta mal que yo lo diga, pero soy muy bueno en el diseño frontend 😜.</p>
<p>Me gusta sentirme dueño de los proyectos en los que trabajo y no solo escribir código, sino también tener una visión crítica del producto, las funcionalidades y el modelo de negocio. No soy solo un profesional que escribe codigo, soy un profesional que soluciona problemas.</p>
<h3>Ultimos 2 Empleos</h3>
<ul>
  <li>Adalid, Teacher</li>
  <li>Desafío Latam, Teacher</li>
</ul>
```

Modificar el archivo `app/views/pages/contact.html.erb` para agregar el contenido de la página.

```erb
# app/views/pages/contact.html.erb
<h1>Pages#contact</h1>
<form>
  <div class="grid">
    <label for="name">Name</label>
    <input type="name" id="name" name="name" placeholder="Name" required>
    <br>
    <label for="email">Email</label>
    <input type="email" id="email" name="email" placeholder="Email" required>
    <br>
    <label for="comments">Comments</label>
    <textarea name="textarea"></textarea>
    <br>
    <button type="submit">Submit</button>
  </div>
</form>
```

Agregar navegación entre las páginas

```erb
# app/views/layouts/application.html.erb
<nav>
  <ul>
    <li><%= link_to "Home", root_path %></li>
    <li><%= link_to "Contact", contact_path %></li>
  </ul>
</nav>
```

Hacemos un commit con el código generado

```bash
git add .
git commit -m "Creación de proyecto y vistas"
```

Subimos el código a github

```bash
git push origin main
```
