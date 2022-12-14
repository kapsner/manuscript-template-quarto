yml_to_modify <- readLines(here::here("_quarto.yml"))

change_yml <- gsub("index.qmd", "supplement.qmd", yml_to_modify)
change_yml <- gsub("output-file: (.*)$", "output-file: Supplementary_Information", change_yml)
change_yml <- gsub("fig-title: Figure", "fig-title: Figure S", change_yml)
change_yml <- gsub("tbl-title: Table", "tbl-title: Table S", change_yml)

generic_path_changes <- c(
  "output-dir", "bibliography", "csl",
  "scholarly-metadata-quarto.lua", "author-info-blocks-quarto.lua"
)
for (element in generic_path_changes) {
  if (!grepl(pattern = "\\.lua$", x = element)) {
    element_pattern <- paste0("(", element, ": )(.*)")
    replacement <- "\\1../\\2"
  } else {
    element_pattern <- paste0("(- )(.*", element, ")")
    replacement <- "\\1../\\2"
  }
  change_yml <- gsub(
    pattern = paste0(element_pattern, "$"),
    replacement = replacement,
    x = change_yml
  )
}

writeLines(
  text = change_yml,
  con = here::here("11supplement", "_quarto.yml")
)