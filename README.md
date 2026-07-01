# A549_spheroid_DTPs
This repository contains the analysis pipeline associated with the publication:

**Fauveau et al. (2026). Dissecting residual disease in spheroids reveals pan-cancer persistence signatures and a therapeutic window for Oncolytic Viruses. Molecular Therapy Oncology.**

This study characterizes drug-tolerant persister (DTP) cells in A549 spheroids treated with cisplatin and pemetrexed. Using single-cell RNA-seq data and integrating multiple published datasets, it identifies conserved persistence signatures and explores the potential of oncolytic viruses to target DTPs.

This GitHub repository contains:
- **1 ImageJ macro** developed to measure the spheroids surface area from tiff images (macro_spheroid_surface_measurement.ijm)
- **4 R Notebooks** containing different parts of the pipeline: 
  - A549_object creation_QC_clusters
  - A549_spheroids_analysis
  - Pubmed_gene_data_mining
  - Multidataset_comparison
 
## Analysis of the scRNA-seq
### Data availability and reproducibility 
The A549 spheroid scRNA-seq dataset is available on:
- the EMBL-EBI Single Cell Expression Atlas platform: https://www.ebi.ac.uk/gxa/sc/experiments/E-ANND-7/results/cell-plots, as normalized count matrix.
- on the https://provitd.github.io/studies website, as pre-processed seurat object.

The analysis environment can be reproduced using the `renv.lock` file with the `renv` package.

### Notebooks 
Figures and tables generated from the notebooks are saved in the directory defined by the `path_to_save` object.
Users should update this path before running the notebooks.

#### A549_object creation_QC_clusters
This notebook generates the Seurat object from filtered count matrices. It includes:
- Quality control filtering
- Normalization
- Dimensionality reduction
- Integration using Harmony

#### A549_spheroids_analysis
This notebook contains the code used to analyse the scRNA-seq data of A549 spheroids from the seurat object. 

Inputs needed to run the code: 
- The seurat object containing the A549 spheroids scRNA-seq data (named "data" in the code)
- The supplemental table excel file of the publication which contains the signatures list and the list of resistance- and persistence-associated genes indentified from PubMed publications

#### Pubmed_gene_data_mining
This notebook contains the code used to do generate the list of resistance- and persistence-associated genes using keywords present in titles or abstracts of PubMed publications

Input needed to run the code: 
- The seurat object containing the A549 spheroids scRNA-seq data (named "data" in the code)

#### Multidataset_comparison
This notebook contains the code used to do the multi-dataset comparison, generate the DTP core-signature, and perform its validation in patient MRD datasets

Inputs needed to run the code : 
- The seurat object containing the A549 spheroids scRNA-seq data (named "data" in the code)
- The supplemental table excel file of the publication which contains the signatures list
- The excel file "list_symbols_names.xlsx" which contains the offical genes symbols from the org.HS.eg.db package. This excel file can be download from this GitHub repository.
- Preclinical datasets :
  - Supplementary Table 1 of the publication Dhimolea et al., 2021 (DOI: 10.1016/j.ccell.2020.12.002)
  - Supplementary Table 1 of the publication Hangauer et al., 2017 (DOI: 10.1038/nature24297)
  - Supplementary Table 4 of the publication Rehman et al., 2021 (DOI: 10.1016/j.cell.2020.11.018)
  - The full table of the top differentially expressed genes generated on the Gene Expression Omnibus analysis interface (GEO2R) using the dataset GSE198672 (Moghal et al., 2023)
- MRD patient datasets:
  - The scRNA-seq dataset from Maynard et al., 2020 was obtained from the GitHub repository czbiohub/scell_lung_adenocarcinoma (Data_input/objects/NI02_Epi_Seurat_object_clustered.Rdata)
  - The list of deregulated genes from bulk RNA-seq datasets was obtained from the Supplementary Table 2 of the meta-analysis Liu et al., 2024 (DOI: 10.1186/s40164-024-00509-3)
 
**If you use this code, please cite:
Fauveau et al., 2026 (to be modified once published)**
