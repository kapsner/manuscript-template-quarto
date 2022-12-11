lua_base_url <- "https://raw.githubusercontent.com/kapsner/lua-filters/affiliations_quarto_compatibility/"

# download lua filters
download.file(
  url = paste0(lua_base_url, "author-info-blocks/author-info-blocks-quarto.lua"),
  destfile = here::here("30meta", "author-info-blocks-quarto.lua")
)
download.file(
  url = paste0(lua_base_url, "scholarly-metadata/scholarly-metadata-quarto.lua"),
  destfile = here::here("30meta", "scholarly-metadata-quarto.lua")
)