#### Installation ####

# R version 4.1 or higher is required
install.packages("pacman")
pacman::p_load("tidyverse")
pacman::p_load("glue")
pacman::p_load("patchwork")
pacman::p_load("crayon")
pacman::p_load("viridis")
pacman::p_load("gtools") # for mixedsort()
pacman::p_load("hutils") # for duplicated_rows()
pacman::p_load("data.table")
pacman::p_load("ggbeeswarm")
pacman::p_load("vegan")
pacman::p_load("abind")
pacman::p_load("seqinr")
pacman::p_load("ape")
pacman::p_load("phytools") # for midpoint.root()
pacman::p_load("emmeans")
pacman::p_load("GUniFrac")
pacman::p_load("MiRKAT")
pacman::p_load("vtree")
pacman::p_load("ggtree")
pacman::p_load("rex")
pacman::p_load("pheatmap")
pacman::p_load("viridis")

remotes::install_github("MadsAlbertsen/ampvis2@*release")
remotes::install_github("david-barnett/microViz@*release")
remotes::install_github("mikemc/speedyseq")

pacman::p_load("BiocManager")
# Bioconductor version 3.14 or higher is required
BiocManager::install(version = "3.17")
BiocManager::install("decontam")
BiocManager::install("phyloseq")
BiocManager::install("DESeq2")
BiocManager::install("mixOmics")
BiocManager::install("mia")
BiocManager::install("miaViz")
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("ANCOMBC")

#### Update ####

# To update all packages:
BiocManager::install()
