write_flattened <- function(se, file, assay_name = "counts") {
  A <- se %>%
    SummarizedExperiment::assay(assay_name) %>%
    as.matrix()
  if (any(rowSums(A) == 0)) {
    empty <- rownames(A)[rowSums(A) == 0]
    warning("rows with only zeros found in features: ", paste0(empty, collapse = ", "))
  }
  if (any(colSums(A) == 0)) {
    empty <- colnames(A)[colSums(A) == 0]
    warning("columns with only zeros found in samples: ", paste0(empty, collapse = ", "))
  }

  X <- A <- A %>% as.data.table(keep.rownames = "FeatureID")
  R <- se %>%
    SummarizedExperiment::rowData() %>%
    as.matrix() %>%
    as.data.table(keep.rownames = "FeatureID")
  C <- se %>% SummarizedExperiment::colData()
  C <- C %>%
    lapply(as.character) %>%
    as.data.frame(row.names = rownames(C)) %>%
    as.matrix() %>%
    t() %>%
    as.data.table(keep.rownames = "FeatureID")


  stopifnot(identical(
    A$FeatureID,
    R$FeatureID
  ))
  stopifnot(anyDuplicated(A$FeatureID) == 0)
  X <- merge(X, R, by = "FeatureID", sort = FALSE, all = TRUE)

  stopifnot(identical(
    colnames(A),
    colnames(C)
  ))
  stopifnot(anyDuplicated(colnames(A)) == 0)
  X <- rbind(C, X, fill = TRUE)

  write_tsv(X, file)
}

# se <- SE <- readRDS(file.path(RD_DIR, "SE.rds"))
# SE %>% write_flattened(file.path(RESULTS_DIR, "Flattened_SE.tsv"))
