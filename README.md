#  NOAA National Coral Reef Monitoring Program Coral Benthic Assessment Data - Darwin Core Data Package

This repository contains the Darwin Core Data Package (DwC-DP) representation of the **National Coral Reef Monitoring Program: Assessment of fish communities in the Florida Keys during 2018** dataset.

🔗 **Original dataset**: [National Coral Reef Monitoring Program: Assessment of fish communities in the Florida Keys during 2018 on OBIS IPT](https://ipt-obis.gbif.us/resource?r=floridakeysreefvisualcensus2018)  

📦 **DOI**: https://doi.org/10.15468/ejufy4

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
- Outputs (tab separated files) are saved in `data/dwc-dp/`.

---

## 📦 Software & Reproducibility

This project uses [`renv`](https://rstudio.github.io/renv/) to ensure consistent R package environments.

### ✅ To get started:

```r
# In R
renv::restore()
source("src/map-dataset-to-dwc-dp.R")
```

## Citation

> NOAA Southeast Fisheries Science Center, NOAA National Centers for Coastal Ocean Science, Blondeau J, US DOC; NOAA; NMFS; Southeast Fisheries Science Center (NMFS/SEFSC) (2024). National Coral Reef Monitoring Program: Assessment of fish communities in the Florida Keys during 2018. Version 1.7. United States Geological Survey. Samplingevent dataset. https://ipt-obis.gbif.us/resource?r=floridakeysreefvisualcensus2018&v=1.7