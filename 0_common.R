#### Common packages ####

library(stringr)
library(forcats)
library(ggplot2)
library(tibble)
library(data.table)


#### Shortcut functions ####

g <- glue::glue
r <- rex::rex
write_tsv <- function(...) data.table::fwrite(..., sep = "\t")


#### Project folders ####

METADATA_DIR <- "Metadata"
RESULTS_DIR <- "Results"
DATA_DIR <-
  RESULTS_DIR %>%
  list.dirs(recursive = FALSE) %>%
  head(1)
# if there are multiple data folders, you can select what you need like this:
# str_subset("rRNA_SSU_515_806")
# or you can manually specify the folder like this:
# file.path(RESULTS_DIR, "JMF-1234-56__all__rRNA_SSU_515_806__JMFR_MS01_ABC12")
RD_DIR <- "RD"
PLOTS_DIR <- "Plots"
DiffAbund_DIR <- "DiffAbund"


#### Project settings ####

PROJECT_NAME <-
  DATA_DIR %>%
  basename() %>%
  str_remove("_.+")


#### Default options ####

# setting the seed makes all output reproducible:
set.seed(42)


#### I/O ####

# make sure all folders exist:
dir.create(RD_DIR, showWarnings = FALSE)
dir.create(RESULTS_DIR, showWarnings = FALSE)
dir.create(PLOTS_DIR, showWarnings = FALSE)
dir.create(DiffAbund_DIR, showWarnings = FALSE)

