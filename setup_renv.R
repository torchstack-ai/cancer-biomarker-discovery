# Install renv if not already installed
if (!requireNamespace("renv", quietly = TRUE)) {
  install.packages("renv", repos = "https://cloud.r-project.org")
}

# Initialize renv
renv::init(force = TRUE)

# Install BiocManager first
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}

# Install Bioconductor packages first
BiocManager::install(c("MAST", "DESeq2", "SingleCellExperiment"))

# Install CRAN packages
renv::install(c(
  "svDialogs",
  "vroom",
  "dplyr",
  "DT",
  "Seurat",
  "harmony",
  "patchwork",
  "ggplot2",
  "ggrepel",
  "ggvenn",
  "openxlsx",
  "progress",
  "rio",
  "pheatmap",
  "ggfortify",
  "devtools",
  "Rcpp",
  "RcppArmadillo"
))

# Install presto from GitHub with explicit dependencies
renv::install("immunogenomics/presto", type = "github")

# Verify presto installation
if (!requireNamespace("presto", quietly = TRUE)) {
  stop("Failed to install presto package")
}

# Snapshot the current state
renv::snapshot() 