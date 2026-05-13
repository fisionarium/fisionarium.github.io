# Fisionarium

Página web del centro de fisioterapia **Fisionarium** en L'Hospitalet de Llobregat.
El sitio es bilingüe: catalán (idioma por defecto) y español.

La web está construida con [Hugo](https://gohugo.io/), un generador de sitios estáticos.
Esto significa que el contenido se escribe en archivos de texto (Markdown) y Hugo genera las páginas HTML automáticamente.

El despliegue se hace con GitHub Pages: cada vez que se suben cambios a la rama `main`,
GitHub Actions construye el sitio y lo publica en https://fisionarium.github.io/.

---

## Índice

1. [Estructura del proyecto](#estructura-del-proyecto)
2. [Cómo editar el contenido desde GitHub](#cómo-editar-el-contenido-desde-github)
3. [Cómo añadir imágenes nuevas](#cómo-añadir-imágenes-nuevas)
4. [Cómo crear una página nueva](#cómo-crear-una-página-nueva)
5. [Cómo se publican los cambios](#cómo-se-publican-los-cambios)
6. [Desarrollo local (para programadores)](#desarrollo-local-para-programadores)

---

## Estructura del proyecto

```
fisionarium.github.io/
├── content/           → Páginas en catalán (idioma por defecto)
│   ├── _index.md      → Portada
│   ├── services.md    → Servicios
│   └── contact.md     → Contacto
├── content/es/        → Mismas páginas, traducidas al español
│   ├── _index.md
│   ├── services.md
│   └── contact.md
├── i18n/              → Textos de la interfaz (menús, botones, títulos)
│   ├── ca.toml        → Catalán
│   └── es.toml        → Español
├── static/            → Imágenes y archivos estáticos
│   ├── 1.jpg a 12.jpg → Fotos (carruseles, galería, secciones)
│   ├── img/logo.png   → Logotipo
│   └── favicon.png    → Icono de la pestaña del navegador
├── hugo.toml          → Configuración general (datos de contacto, redes sociales, menú)
├── assets/            → Archivos técnicos (CSS y JavaScript)
│   ├── css/main.css
│   └── js/main.js
├── layouts/           → Plantillas HTML (solo para desarrolladores)
├── public/            → NO TOCAR. Se genera automáticamente al construir la web
├── resources/         → NO TOCAR. Caché interna de Hugo
├── archetypes/        → Plantilla para páginas nuevas
├── flake.nix          → Configuración de Nix (entorno de desarrollo)
└── .github/workflows/ → Configuración del despliegue automático
```

### `content/` — Páginas (catalán)

Aquí están los archivos Markdown (`.md`) que contienen el texto de cada página.
Cada archivo tiene dos partes:

- **Front matter** (entre `---`): metadatos como título, descripción y plantilla.
- **Cuerpo**: el contenido visible de la página, escrito en Markdown.

Para editar el texto de una página, solo hay que modificar el cuerpo (la parte de abajo).
El Markdown es muy sencillo:

- `## Título` → encabezado
- `- texto` → lista con viñetas
- `[texto](url)` → enlace
- `**negrita**` → texto en negrita

#### Archivos en catalán (`content/`)

| Archivo | Página | ¿Qué contiene? |
|---|---|---|
| `_index.md` | Portada | Metadatos (sin cuerpo visible, el contenido lo generan las plantillas) |
| `services.md` | /services/ | Lista de servicios que ofrece la clínica |
| `contact.md` | /contact/ | Metadatos (sin cuerpo visible, el formulario lo genera la plantilla) |

### `content/es/` — Páginas en español

Misma estructura que `content/` pero traducida al español.
Si se añade una página nueva en catalán, hay que crear su equivalente aquí.

### `i18n/` — Textos de la interfaz

Estos archivos contienen todos los textos fijos de la web: títulos de secciones,
botones, etiquetas del formulario, textos del pie de página, etc.

- `ca.toml` → versión en catalán
- `es.toml` → versión en español

Cada entrada tiene el formato `clave = "texto"`. Para cambiar un texto, solo hay
que editar el valor (lo que va entre comillas) en ambos archivos.

Ejemplo:
```toml
# En i18n/ca.toml
hero_title = "Fisioterapia personalitzada, orientada al moviment"

# En i18n/es.toml
hero_title = "Fisioterapia personalizada, orientada al movimiento"
```

### `static/` — Imágenes

Aquí están todas las imágenes de la web. Las fotos disponibles son:

| Archivo | Descripción |
|---|---|
| `img/logo.png` | Logotipo de Fisionarium |
| `favicon.png`, `favicon.ico`, `apple-touch-icon.png` | Iconos del navegador |
| `1.jpg`, `2.jpg`, `3.jpg` | Carrusel del héroe (portada) |
| `4.jpg`, `5.jpg`, `7.jpg` | Carrusel de la clínica |
| `12.jpg` | Sección "Conócenos" |
| `6.jpg`, `8.jpg`, `9.jpg`, `10.jpg`, `11.jpg` | Fotos disponibles para nuevo contenido |

### `hugo.toml` — Configuración general

Este archivo contiene:

- **Datos de contacto**: teléfono, email, dirección, enlace a WhatsApp, mapa.
- **Redes sociales**: Instagram, WhatsApp.
- **Menú de navegación**: los enlaces de la barra superior.

Para cambiar el teléfono, el email o la dirección, es aquí donde se hace.

### `assets/` — CSS y JavaScript (solo para desarrolladores)

- `css/main.css`: estilos visuales de la web.
- `js/main.js`: funcionalidades interactivas.

Si no sabes programar, es mejor no tocar estos archivos.

### `layouts/` — Plantillas HTML (solo para desarrolladores)

Contiene las plantillas que definen cómo se muestra cada página.
No hace falta tocarlas para cambiar el contenido.

### `public/` y `resources/` — Archivos generados

**No se deben editar manualmente.** Estos directorios se generan solos al
construir la web con Hugo. Están en `.gitignore` para que no se suban al
repositorio (en el caso de `resources/`), o los genera GitHub Actions durante
el despliegue (en el caso de `public/`).

### `archetypes/`, `flake.nix`, `.github/workflows/`

Son archivos técnicos para desarrolladores:
- `archetypes/default.md`: plantilla que usa Hugo al crear una página nueva.
- `flake.nix`: define el entorno de desarrollo con Nix (incluye Hugo).
- `.github/workflows/hugo.yaml`: configuración de GitHub Actions que despliega la web automáticamente.

---

## Cómo editar el contenido desde GitHub

Puedes editar cualquier archivo directamente desde el navegador web en GitHub.
No necesitas instalar nada.

### Cambiar el texto de una página

1. Ve al repositorio en https://github.com/fisionarium/fisionarium.github.io
2. Navega hasta `content/` (o `content/es/` para la versión en español).
3. Haz clic en el archivo que quieras editar (por ejemplo, `services.md`).
4. Haz clic en el icono del lápiz (✏️) en la esquina superior derecha.
5. Edita el texto. El cuerpo del archivo usa Markdown (ver más arriba).
6. Al final de la página, escribe una descripción breve del cambio (por ejemplo, "Actualizar lista de servicios").
7. Selecciona "Commit directly to the `main` branch".
8. Haz clic en "Commit changes".

La web se actualizará automáticamente en unos 2-3 minutos.

### Cambiar los datos de contacto

1. Ve a `hugo.toml` en la raíz del repositorio.
2. Haz clic en el icono del lápiz (✏️).
3. Localiza la sección `[params.contact]`. Ahí puedes cambiar:
   - `phone` y `phone_display`: número de teléfono.
   - `whatsapp`: enlace de WhatsApp.
   - `email`: dirección de correo electrónico.
   - `address`: dirección física.
   - `schedule`: horario.
4. Cambia también la sección `[params.social]` si es necesario.
5. Haz clic en "Commit changes".

### Cambiar un texto de la interfaz (botones, títulos, etc.)

1. Ve a `i18n/ca.toml` para la versión en catalán.
2. Busca la clave del texto que quieres cambiar (por ejemplo, `hero_title`).
3. Edita el valor entre comillas.
4. Repite el mismo cambio en `i18n/es.toml` para la versión en español.
5. Haz clic en "Commit changes".

---

## Cómo añadir imágenes nuevas

1. Ve al repositorio en GitHub.
2. Entra en la carpeta `static/`.
3. Haz clic en "Add file" → "Upload files".
4. Arrastra o selecciona la imagen desde tu ordenador.
5. Nombra el archivo siguiendo la numeración existente (por ejemplo, `13.jpg`).
6. Abajo, escribe una descripción breve y selecciona "Commit directly to the `main` branch".
7. Haz clic en "Commit changes".

Para usar la imagen nueva en una página, necesitarás que un desarrollador
modifique la plantilla correspondiente en `layouts/`.

---

## Cómo crear una página nueva

1. Ve a `content/` en GitHub.
2. Haz clic en "Add file" → "Create new file".
3. Nombra el archivo (por ejemplo, `team.md`).
4. Escribe el contenido con este formato:

```markdown
---
title: Nombre de la página
layout: page
description: "Breve descripción para los buscadores."
---

## Contenido de la página

Escribe aquí el texto de la página en Markdown.
```

5. Haz clic en "Commit changes".
6. Crea el mismo archivo en `content/es/` con el texto traducido.
7. Pide a un desarrollador que añada la plantilla en `layouts/` si la página
   necesita un diseño especial, o que la añada al menú de navegación en `hugo.toml`.

> Nota: para la mayoría de páginas nuevas, con crear el archivo Markdown ya es
> suficiente. La web usará la plantilla `page.html` automáticamente.

---

## Cómo se publican los cambios

Cada vez que haces "Commit changes" directamente a la rama `main`, ocurre esto:

1. GitHub Actions detecta el cambio.
2. Construye la web con Hugo (versiones: Hugo 0.152.2, Dart Sass 1.99.0, Go 1.26.1).
3. Sube el resultado a GitHub Pages.
4. Pasados unos segundos, los cambios están visibles en https://fisionarium.github.io/.

Puedes ver el progreso en la pestaña "Actions" del repositorio.

---

## Desarrollo local (para programadores)

Si quieres probar cambios en tu ordenador antes de subirlos, necesitas
instalar Hugo. La forma más sencilla es usar Nix.

### Con Nix (recomendado)

```bash
# Entrar en el entorno de desarrollo
nix develop

# O si usas direnv
direnv allow

# Iniciar el servidor local
hugo server
```

### Sin Nix

Instala Hugo manualmente desde https://gohugo.io/installation/.
Necesitas la versión extendida (extended). Una vez instalado:

```bash
# Iniciar el servidor local
hugo server
```

### Ver la web en local

Abre http://localhost:1313/ en el navegador. El servidor se actualiza solo
cuando modificas un archivo.

### Comandos útiles

```bash
# Construir la web para producción (genera la carpeta public/)
hugo

# Verificar el formato del código (usa treefmt)
nix fmt

# Verificar el formato sin modificar archivos
nix flake check
```
