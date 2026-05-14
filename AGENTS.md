## Context

Fisionarium is a fisioterapy center in L'Hospitalet de Llobregat, Spain. The site is bilingual: Catalan (default) and Spanish. Every page must exist in both languages.

## Build

- Use `nix develop` or `direnv allow`; `.envrc` is `use flake`.
- `nix fmt` runs treefmt with `alejandra`, `deadnix`, and `prettier`.
- `nix flake check` runs the formatting check.
- There is no `package.json`; the Node step in CI is a no-op.
- Hugo dev server: `hugo server` from the repo root.

## Site architecture

- Hugo site with root config `hugo.toml`. Default language is Catalan.
- Content dirs: `content/` for Catalan, `content/es/` for Spanish. `content/ca/` exists but is unused.
- Layout entrypoints: `layouts/baseof.html` wraps all pages; `layouts/home.html` is the landing page; `layouts/contact.html` and `layouts/page.html` handle inner pages. Partials live in `layouts/_partials/`.
- All UI text uses Hugo's `{{ T "key" }}` i18n mechanism. Keys are defined in `i18n/ca.toml` and `i18n/es.toml`. When adding text, add the key to both files.
- All section anchors (`id` attributes on sections) must be in English.
- Navbar items come from `hugo.toml` `menu.nav`, but the CTA button ("Demana cita") and the language dropdown are hardcoded in `layouts/_partials/header.html`.
- CSS lives in `assets/css/main.css`, JS in `assets/js/main.js`. Hugo Pipes fingerprints/minifies both in production.
- The site uses Bootstrap 5.3 (CDN in `baseof.html`) and Bootstrap Icons (CDN in `head.html`).

## Static images

- Placeholder images: `/1.jpg` through `/12.jpg` in `static/`. Also `static/img/logo.png`.
- Already used in templates: `1.jpg`, `2.jpg`, `3.jpg` (hero carousel), `12.jpg` (about section), `img/logo.png` (header brand), `img/facilities/gimnas_1.jpeg` through `gimnas_4.jpeg` (facilities carousel).
- Available for new content: `4.jpg`, `5.jpg`, `6.jpg`, `7.jpg`, `8.jpg`, `9.jpg`, `10.jpg`, `11.jpg`.

## Generated files

Do not edit `public/`, `resources/_gen/`, or `/.hugo_build.lock`.

## Deploy

GitHub Pages builds from `main` via `.github/workflows/hugo.yaml`. CI pins: Hugo 0.152.2, Go 1.26.1, Node 24.14.1, Dart Sass 1.99.0.