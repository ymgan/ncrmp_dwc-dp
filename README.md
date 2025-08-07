#  NOAA National Coral Reef Monitoring Program Coral Benthic Assessment Data - Darwin Core Data Package

This repository contains the Darwin Core Data Package (DwC-DP) representation of the **NOAA National Coral Reef Monitoring Program (NCRMP): Benthic Assessment** dataset.

🔗 **Original dataset**: [NOAA NCRMP Benthic Assessment on OBIS IPT](https://ipt-obis.gbif.us/resource?r=noaa_ncrmp_benthic_assessment)  
📦 **DOI**: [10.7289/v5vd6wts](https://doi.org/10.7289/v5vd6wts)  
🧰 **Built with**: R + tidyverse + renv

---

## 📁 Folder Structure

```
├── data
│   ├── dwca-floridakeysreefvisualcensus2018-v1.7   # Original DwC-A from OBIS IPT
│   └── dwc-dp                                       # Converted Darwin Core Data Package
├── src
│   ├── helpers.R                                    # Utility functions
│   └── map-dataset-to-dwc-dp.R                      # Main script for conversion
├── renv                                             # renv environment for reproducibility
├── renv.lock                                        # Locked package versions
├── ncrmp.Rproj                                      # RStudio project file
└── README.md                                        # This file
```

---

## 🧪 Mapping Details

- The original **Darwin Core Archive (DwC-A)** was downloaded from the OBIS IPT and stored under `data/dwca-floridakeysreefvisualcensus2018-v1.7/`.
- The dataset was mapped to **Darwin Core Data Package (DwC-DP)** format using R.
- Outputs (CSV and `meta.yaml`) are saved in `data/dwc-dp/`.

---

## 📦 Software & Reproducibility

This project uses [`renv`](https://rstudio.github.io/renv/) to ensure consistent R package environments.

### ✅ To get started:

```r
# In R
renv::restore()
source("src/map-dataset-to-dwc-dp.R")
```