document.addEventListener("click", (event) => {
  const link = event.target.closest(".navbar .nav-link");
  if (!link) {
    return;
  }

  const navbar = document.querySelector("#siteNavbar");
  if (!navbar || !navbar.classList.contains("show")) {
    return;
  }

  const collapse = bootstrap.Collapse.getOrCreateInstance(navbar);
  collapse.hide();
});
