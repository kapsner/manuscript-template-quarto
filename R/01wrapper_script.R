rebuild <- FALSE
manuscript_data <- here::here(".all_data")

if (isTRUE(rebuild)) {
  
  source(here::here("00data", "01data_preparation.R"))
  source(here::here("00data", "02data_import.R"))
  source(here::here("R", "02experiments.R"))
  source(here::here("R", "03statistics.R"))
  
  save.image(file = manuscript_data)
  
} else {
  if (file.exists(manuscript_data)) {
    load(file = manuscript_data)
  }
}