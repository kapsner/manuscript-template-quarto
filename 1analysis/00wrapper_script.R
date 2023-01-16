rebuild <- FALSE
manuscript_data <- here::here(".all_data")

if (isTRUE(rebuild)) {
  
  source(here::here("1analysis", "01data_handling.R"))
  source(here::here("1analysis", "02data_import.R"))
  source(here::here("1analysis", "10experiments.R"))
  source(here::here("1analysis", "11statistics.R"))
  
  save.image(file = manuscript_data)
  
} else {
  if (file.exists(manuscript_data)) {
    load(file = manuscript_data)
  }
}
