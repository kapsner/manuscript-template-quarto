# check for installed packages, install other packages if necessary
installed_pkg <- installed.packages()[, "Package"]

# installer
installer_pkg <- c("remotes", "pak")
sapply(installer_pkg, function(x) if (!(x %in% installed_pkg)) install.packages(x))

# necessary packages
necessary_packages <- c(
  "kapsner/kdry",
  "data.table",
  "magrittr",
  "quarto",
  "here",
  "knitr",
  "kableExtra"
)
sapply(necessary_packages, function(x) if (!(x %in% installed_pkg)) pak::pkg_install(x))

# install quarto extension
if (!file.exists(here::here("_extensions/kapsner/authors-block"))) {
  cmd <- "quarto add --no-prompt kapsner/authors-block"
  system(command = cmd)
}