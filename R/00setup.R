# install quarto extension
if (!file.exists(here::here("_extensions/kapsner/authors-block"))) {
  cmd <- "quarto add --no-prompt kapsner/authors-block"
  system(command = cmd)
}