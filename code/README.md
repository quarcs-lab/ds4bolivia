# Code and Data Processing Scripts

## Overview

This directory contains data processing scripts and machine learning models used to construct datasets and perform poverty predictions in this repository. The scripts are organized by type and function.

## Scripts Overview

### Python Scripts - Data Processing

#### satellite_data_merger.py

Merges satellite-derived datasets (embeddings, NTL, land cover) with socio-economic indicators. Handles spatial joins and data alignment.

**Functionality:**
- Merges satellite embeddings with SDG data
- Handles spatial data alignment
- Exports merged datasets for analysis

**Usage:**
```bash
python code/satellite_data_merger.py
```

---

### Python Scripts - Machine Learning Models

#### run_poverty_prediction.py

**Predicting General Poverty (SDG 1) Using Random Forest**

Predicts the SDG 1 Index (No Poverty) using 64-dimensional satellite imagery embeddings.

**Key Features:**
- Random Forest regression with 500 trees
- 5-fold cross-validation
- Feature importance analysis
- Prediction error analysis by municipality
- Identifies overpredicted and underpredicted municipalities

**Performance:**
- Cross-validation R²: 0.3614 (±0.0685)
- Test R²: 0.4025
- Test RMSE: 17.48 percentage points
- Test MAE: 13.33 percentage points

**Top 5 Features:** A43, A59, A13, A07, A04

**Usage:**
```bash
python code/run_poverty_prediction.py
```

**Companion Notebook:** [predict_poverty_rf.ipynb](../notebooks/predict_poverty_rf.ipynb)

---

#### run_energy_prediction.py

**Predicting Energy Poverty (SDG 7 Index) Using Random Forest**

Predicts the SDG 7 Index (Affordable and Clean Energy) using satellite embeddings.

**Key Features:**
- Comparison with SDG 1 (general poverty) patterns
- Correlation analysis: SDG 1 vs SDG 7 = 0.9197
- Identifies municipalities with unique energy access patterns
- Analyzes urban vs rural disparities

**Performance:**
- Cross-validation R²: 0.2482 (±0.0978)
- Test R²: 0.3507
- Test RMSE: 13.43 percentage points
- Test MAE: 10.03 percentage points

**Top 5 Features:** A13, A57, A59, A21, A52

**Usage:**
```bash
python code/run_energy_prediction.py
```

**Companion Notebook:** [predict_energy_rf.ipynb](../notebooks/predict_energy_rf.ipynb)

---

#### run_extreme_energy_poverty.py ⭐ **Recommended**

**Predicting Extreme Energy Poverty Rate Using Random Forest**

Predicts `sdg1_1_eepr` - the percentage of houses in extreme energy poverty (2016). This uses a **direct measurement** rather than composite indices.

**Why This Model?**
- Direct measurement: % of houses in extreme energy poverty
- Better cross-validation performance (R² = 0.57)
- Policy relevant: Directly actionable for electrification programs
- Clear interpretation: Easy to communicate findings

**Key Features:**
- Analysis of 315 municipalities (24 missing data)
- Correlation with related poverty indicators
- Identifies systematic urban/rural prediction errors
- Only 36/64 features (56%) needed for 80% importance

**Performance:**
- Cross-validation R²: 0.5704 (±0.0823)
- Test R²: 0.2216
- Test RMSE: 21.51 percentage points
- Test MAE: 15.52 percentage points

**Top 5 Features:** A43, A25, A23, A61, A62

**Critical Findings:**
- Urban centers systematically overpredicted (La Paz: 62pp error, Quillacollo: 64pp error)
- Rural extreme poverty underpredicted (Cocapata: 40pp error)
- Strong correlation with unsatisfied basic needs (r = 0.80)
- Negative correlation with electricity coverage (r = -0.66)

**Usage:**
```bash
python code/run_extreme_energy_poverty.py
```

**Companion Notebook:** [predict_extreme_energy_poverty_rf.ipynb](../notebooks/predict_extreme_energy_poverty_rf.ipynb)

---

### Stata Scripts (.do files)

Data cleaning and transformation scripts written in Stata for processing socio-economic indicators and satellite-derived variables.

| Script | Description |
| --- | --- |
| **010_add_poly_id_and____.do** | Adds polygon identifiers to spatial datasets |
| **020_create_regional_identifiers_dataset.do** | Creates the regionNames dataset with administrative metadata (municipalities, departments, IDs) |
| **030_clean_and_estimate_NTL_trends.do** | Cleans and estimates time trends for night-time lights (NTL) data across municipalities |
| **040_clean_and_estimate_Population_trends.do** | Processes population data and estimates temporal trends (2001-2020) |
| **050_clean_and_estimate_CO2_trends.do** | Cleans and estimates CO2 emissions trends from satellite data |
| **060_compute_NTL_pc.do** | Computes night-time lights per capita (NTL/population) for economic analysis |
| **070_combine_SDGs_lnNTLpc_POP_CO2.do** | Merges SDG indicators with log NTL per capita, population, and CO2 data into master dataset |
| **080_translate_and_selectVariables.do** | Translates variable names from Spanish to English and selects final variables for publication |
| **save_variable_names_and_labes_as_CSV_file.do** | Exports variable metadata (names and labels) to CSV for documentation |

---

### JavaScript Scripts (.js files)

Google Earth Engine (GEE) scripts for processing satellite imagery at scale.

| Script | Description |
| --- | --- |
| **aggregate-satellite-embedings-to-adm.js** | Aggregates Google Satellite Embeddings from 10m resolution to municipal boundaries using spatial mean reduction. Generates the 64-dimensional feature vectors used in machine learning models. See detailed documentation in [satelliteEmbeddings/README.md](../satelliteEmbeddings/README.md) |

---

## Data Processing Workflow

The scripts follow this general sequence:

1. **Spatial Identifiers** (010, 020): Create unique IDs and administrative metadata
2. **Time Series Processing** (030-050): Clean and estimate trends for satellite-derived variables
3. **Derived Variables** (060): Compute per capita metrics and transformations
4. **Data Integration** (070, satellite_data_merger.py): Merge multiple data sources
5. **Finalization** (080): Translate, select, and document final variables
6. **Machine Learning** (run_*.py): Train models and predict poverty indicators

---

## Output Datasets

These scripts generate the CSV files found in:

- [regionNames/](../regionNames/) - Administrative identifiers
- [sdg/](../sdg/) - SDG composite indices
- [sdgVariables/](../sdgVariables/) - Detailed SDG variables (64 variables)
- [pop/](../pop/) - Population time series
- [ntl/](../ntl/) - Night-time lights data
- [satelliteEmbeddings/](../satelliteEmbeddings/) - 64-dimensional satellite feature vectors
- [datasets/](../datasets/) - Merged analytical datasets

---

## Requirements

### Python
```bash
# Core libraries
pandas
numpy

# Spatial data
geopandas

# Machine learning
scikit-learn
matplotlib
seaborn
```

### Stata
- Stata 15 or higher
- Access to raw data files (see [archive20250523/rawData/](../archive20250523/rawData/))

### Google Earth Engine
- GEE account (free for research/education)
- Access to Bolivia municipal boundaries asset
- GEE Python API or Code Editor

---

## Running the Scripts

### Python Scripts - Data Processing

```bash
python code/satellite_data_merger.py
```

### Python Scripts - Machine Learning

```bash
# Poverty prediction (SDG 1)
python code/run_poverty_prediction.py

# Energy poverty (SDG 7 Index)
python code/run_energy_prediction.py

# Extreme energy poverty rate (Recommended)
python code/run_extreme_energy_poverty.py
```

### Stata Scripts

```stata
// Set working directory
cd "/path/to/ds4bolivia"

// Run scripts in sequence
do code/010_add_poly_id_and____.do
do code/020_create_regional_identifiers_dataset.do
// ... etc
```

### JavaScript/GEE Scripts

1. Open [Google Earth Engine Code Editor](https://code.earthengine.google.com/)
2. Copy and paste the script content
3. Update asset paths if necessary
4. Click "Run"
5. Export results to Google Drive

---

## Model Comparison Summary

| Model | Target Variable | Test R² | MAE | Key Insight |
|-------|----------------|---------|-----|-------------|
| **General Poverty** | index_sdg1 | 0.40 | ±13.3pp | Urban centers underpredicted |
| **Energy Poverty** | index_sdg7 | 0.35 | ±10.0pp | Strong correlation with SDG 1 (r=0.92) |
| **Extreme Energy Poverty** ⭐ | sdg1_1_eepr | 0.22 (CV: 0.57) | ±15.5pp | Best CV performance, clearest interpretation |

**Recommendation:** Use `run_extreme_energy_poverty.py` for most analyses due to direct measurement and better cross-validation performance.

---

## Companion Resources

### Interactive Notebooks
All Python scripts have companion Jupyter notebooks in [notebooks/](../notebooks/):
- [predict_poverty_rf.ipynb](../notebooks/predict_poverty_rf.ipynb)
- [predict_energy_rf.ipynb](../notebooks/predict_energy_rf.ipynb)
- [predict_extreme_energy_poverty_rf.ipynb](../notebooks/predict_extreme_energy_poverty_rf.ipynb)

### Analysis Documentation
- [ANALYSIS_COMPARISON.md](../notebooks/ANALYSIS_COMPARISON.md) - Comprehensive comparison of all three models

---

## Project Documentation

For more information about the research project and methodology:

- **Video Introduction**: [Project Overview](https://www.loom.com/share/07206f02b269485293ac7c8ad4df3c7f)
- **Computational Environment**: [Deepnote Notebooks](https://deepnote.com/project/project2021o-Bolivia-esda-HABNFWMYQ8CWOKKwDrJrTQ)

---

## Collaborators

- Carlos Mendez (carlos@gsid.nagoya-u.ac.jp, Nagoya University)
- Erick Gonzales (erick.gonzalesrocha@un.org, United Nations Office for Disaster Risk Reduction)
- Pedro Leoni (pedroleoni1605@gmail.com)

---

## References

- [Anselin, L., Sridharan, S., & Gholston, S. (2007). Using exploratory spatial data analysis to leverage social indicator databases](https://kami.app/NduBfCB3hNln)
- [Mendez, C., & Gonzales, E. (2021). Human Capital Constraints, Spatial Dependence, and Regionalization in Bolivia](https://doi.org/10.18800/economia.202101.007)
- [Geographic Data Science with Python](https://geographicdata.science/book/intro.html)
- [GeoDa Workbook](https://geodacenter.github.io/documentation.html)

---

## Data Sources

- [Andersen, L. E., Canelas, S., Gonzales, A., Peñaranda, L. (2020) Atlas Municipal de los ODS Bolivia 2020](https://atlas.sdsnbolivia.org)

---

## Citation

```
Mendez, C., Gonzales, E., Leoni, P., Andersen, L., Peralta, H. (2026).
DS4Bolivia: A Data Science Repository to Study GeoSpatial Development in Bolivia
[Data set]. GitHub. https://github.com/quarcs-lab/ds4bolivia
```
