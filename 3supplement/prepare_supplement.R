yml_to_modify <- readLines(here::here("_quarto.yml"))

change_yml <- gsub("index.qmd", "supplement.qmd", yml_to_modify)
change_yml <- gsub("output-file: (.*)$", "output-file: Supplementary_Information", change_yml)
change_yml <- gsub("fig-title: Figure", "fig-title: Figure S", change_yml)
change_yml <- gsub("tbl-title: Table", "tbl-title: Table S", change_yml)

recursive_copy <- function(old_dir, new_dir_base) {
  cur_files <- list.files(path = old_dir, all.files = FALSE, full.names = FALSE)
  for (f in cur_files) {
    fn_old <- file.path(old_dir, f)
    fn_new <- file.path(new_dir_base, f)
    fi <- file.info(fn_old)
    if (fi$isdir) {
      dir.create(fn_new, recursive = TRUE)
      recursive_copy(old_dir = fn_old, new_dir_base = fn_new)
    } else {
      file.copy(from = fn_old, to = fn_new)
    }
  }
}

ext_dir <- here::here("_extensions")
if (file.exists(ext_dir)) {
  
  supp_extensions <- here::here("3supplement", "_extensions")
  recursive_copy(old_dir = ext_dir, new_dir_base = supp_extensions)
}

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
  con = here::here("3supplement", "_quarto.yml")
)