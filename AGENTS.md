## Context

This is a webpage for Fisionarium, a fisio center in Hospitalet de Llobregat, Spain. The site is in Catalan and Spanish, ALL the pages must have both versions.

## Inspiration

The desing of the website is inspired by different websites of the same sector.
Hera are some examples that we used as inspiration:

- https://fisioterapiaigualada.es/
- https://www.fisioenric.com/

## Build

- Use `nix develop` or `direnv allow`, `.envrc` is `use flake`.
- `nix fmt` runs treefmt with `alejandra`, `deadnix`, and `prettier`.
- `nix flake check` only runs the formatting check from `flake.nix`.
- There is no `package.json`, so the Node step in CI is a no-op here.

## Site

- This is a Hugo site, edit `content/`, `layouts/`, `assets/`, `static/`, and `i18n/`.
- Root config is `hugo.toml`; default language is `ca`, Spanish content lives in `content/es/`.
- The main entrypoints are `layouts/baseof.html`, `layouts/home.html`, `layouts/page.html`, and `layouts/_partials/header.html`.
- Navbar labels come from `hugo.toml` `menu.nav`, but the final menu and language markup live in `layouts/_partials/header.html`.
- Hugo Pipes fingerprints/minifies `assets/css/main.css` and `assets/js/main.js` in production.
- The home carousel uses `static/1.jpg`, `static/2.jpg`, and `static/3.jpg`.
- Images in `static/` with numbered names are used for placeholder content. Whenever you need to add an image to the website, use one of these. If posible, one not used yet.

## Generated

- Do not edit `public/`, `resources/_gen/`, or `/.hugo_build.lock`.

## Deploy

- GitHub Pages builds and deploys from `main` using `.github/workflows/hugo.yaml`.
- CI pins Hugo `0.152.2`, Go `1.26.1`, Node `24.14.1`, and Dart Sass `1.99.0`.

## Website content and structure

The website must have a header with diferent sections, that link to different pages and parts of the landing page.

### Sections

The sections are:

- Serveis -> links to a part of the landing page (or main)
- Conócenos -> links to a part of the landing page (or main)
- Contacte -> links to a different page specific to this section
- Clinica -> links to a different page specific to this section
- Idioma -> dropdown menu to select between Catalan and Spanish, the default is Catalan.

### Landing page

The landing page must have different sections, divided horizontally. The structure of the landing page is as follows:

- Header: with the sections described above
- Carousel: with 3 images, each one of them will have some text, and will be a link to the respective section. Sections to have in the carousel are: `servicios`, `clinica`
  and `contacto`
- Servicios: with a short description of the services offered by the clinic, and a link to the respective page with more information about the services.
- Conocenos: with a short description of the clinic, and a link to the respective page with more information about the clinic. With a picture of the clinic and/or the team.
- Reviews: with some reviews from clients, with their name and a short description of their experience with the clinic, and some stars or rate attractive.
- Demana cita: (small) link to whatsapp and/or to a form to request an appointment.

### Contact page

The contact page must include:

- Contact form
- Telephone
- Email
- Address
- WhatsApp, Facebook, Instagram, and LinkedIn links/icons

### Clinica page

The clinic page must include:

- Descripción de la clínica (clinic description)
- Carrousel de fotos de la clínica (carousel of clinic photos)
- Localización en google maps + dirección (location on Google Maps + address)
