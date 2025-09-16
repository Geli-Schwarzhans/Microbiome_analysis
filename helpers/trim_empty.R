trim_empty <- function(x, verbose = TRUE) {
  rs <- rowSums(assay(x))
  cs <- colSums(assay(x))

  if (any(rs == 0)) {
    remove <- names(rs[rs == 0])
    x <- x[!rownames(x) %in% remove]

    if (verbose) {
      cat(crayon::blue(glue::glue("trim_empty: Trimmed {length(remove)} empty row(s).")), "\n")
    }
  }

  if (any(cs == 0)) {
    remove <- names(cs[cs == 0])
    x <- x[, !colnames(x) %in% remove]

    if (verbose) {
      cat(crayon::blue(glue::glue("trim_empty: Trimmed {length(remove)} empty column(s).")), "\n")
    }
  }

  x
}
