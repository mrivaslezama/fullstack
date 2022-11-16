# Modulo 8 - Aprendizaje esperado 02

Aplicar procedimiento de integración de un plantilla dentro de un proyecto nuevo en Ruby on Rails para acelerar la construcción del proyecto, en este ejercicio se debe hacer uso de el framework css [Bootstrap](https://getbootstrap.com/) y clonar la estructura de la plantilla proporcionada en el ejercicio, no obstante para efectos de no cargar este proyecto con demasiada información haremos uso de un framework css llamado [Pico.css](https://picocss.com/), el cual es un framework css semantico y que nos permite construir aplicaciones web de manera rápida y sencilla.

Estas son algunas guias de como puede inntegrar bootstrap en su proyecto:

## Requisitos

Tomar en cuenta la siguiente [plantilla](https://es.squarespace.com/plantillas/hart-demo-es) para dar estructura a nuestras vistas con la siguiente estructuras:

1. Inicio:
   - La descripción del perfil esté al medio y grande
   - Una imagen representativa usando el ViewHelper image_tag
   - Descripción de los hobbies a la lado de la imagen
   - Texto de pasiones por debajo de la imagen
2. Contacto:
   - Título grande
   - Nombre de la persona
   - Correo de la persona
   - Campo para escribir el mensaje
   - Botón de enviar

### Procesos

Agregar el framework css [Pico.css](https://picocss.com/) a nuestro proyecto, para esto se debe agregar el cdn en el archivo `app/views/layouts/application.html.erb` en la sección de `head`:

```html
<head>
   <title>RailsTweetAdalid</title>
   <meta name="viewport" content="width=device-width,initial-scale=1">
   <link rel="stylesheet" href="https://unpkg.com/@picocss/pico@latest/css/pico.min.css">
   <%= csrf_meta_tags %>
   <%= csp_meta_tag %>
   <%= stylesheet_link_tag "application", "data-turbo-track": "reload" %>
   <%= javascript_importmap_tags %>
</head>
```

Pico css es un framework css semantico, por lo que con las etiquetas html y con solo agregar algunas las clases que se encuentran en la documentación de [Pico.css](https://picocss.com/) podemos darle estilos a nuestros elementos html y nuestro proyecto se verá de la siguiente manera:

![Vista home](/app/assets/images/estilo_inicial.png "Vista home")
> Vista home.

![Vista contact](/app/assets/images/estilo_inicial_contact.png "Vista contact")
> Vista contact.

Agregaremos imagenes a nuestro **proyecto** en ruby on rails, estas deben guardarse en la siguiente ruta `app/assets/images` y para poder usarlas en nuestras vistas debemos usar el ViewHelper `image_tag`:

```html
<%= image_tag("imagen.jpg", alt: "Imagen", class: "img-responsive") %>
```

Para agregar un botón a nuestro proyecto debemos usar la siguiente estructura:

```html
<button class="btn btn-primary">Enviar</button>
```

Hacemos un commit con el código generado

```bash
git add .
git commit -m "Agregando estilos iniciales"
```

Subimos el código a github

```bash
git push origin main
```
