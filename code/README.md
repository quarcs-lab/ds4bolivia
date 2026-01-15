# Code and Data Processing Scripts

## Overview

This directory contains data processing scripts used to construct the datasets in this repository. The scripts are organized in a numbered sequence that reflects the data pipeline workflow.

## Scripts Overview

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

### Python Scripts (.py files)

| Script | Description |
| --- | --- |
| **satellite_data_merger.py** | Merges satellite-derived datasets (embeddings, NTL, land cover) with socio-economic indicators. Handles spatial joins and data alignment |

### JavaScript Scripts (.js files)

Google Earth Engine (GEE) scripts for processing satellite imagery at scale.

| Script | Description |
| --- | --- |
| **aggregate-satellite-embedings-to-adm.js** | Aggregates Google Satellite Embeddings from 10m resolution to municipal boundaries using spatial mean reduction. Generates the 64-dimensional feature vectors used in machine learning models. See detailed documentation in [satelliteEmbeddings/README.md](../satelliteEmbeddings/README.md) |

## Data Processing Workflow

The scripts follow this general sequence:

1. **Spatial Identifiers** (010, 020): Create unique IDs and administrative metadata
2. **Time Series Processing** (030-050): Clean and estimate trends for satellite-derived variables
3. **Derived Variables** (060): Compute per capita metrics and transformations
4. **Data Integration** (070): Merge multiple data sources
5. **Finalization** (080): Translate, select, and document final variables

## Output Datasets

These scripts generate the CSV files found in:

- [regionNames/](../regionNames/) - Administrative identifiers
- [sdg/](../sdg/) - SDG indices
- [sdgVariables/](../sdgVariables/) - Detailed SDG variables
- [pop/](../pop/) - Population time series
- [ntl/](../ntl/) - Night-time lights data
- [satelliteEmbeddings/](../satelliteEmbeddings/) - Satellite feature vectors
- [datasets/](../datasets/) - Merged analytical datasets

## Requirements

### Stata
- Stata 15 or higher
- Access to raw data files (see [archive20250523/rawData/](../archive20250523/rawData/))

### Python
```python
pandas
geopandas
numpy
```

### Google Earth Engine
- GEE account (free for research/education)
- Access to Bolivia municipal boundaries asset
- GEE Python API or Code Editor

## Running the Scripts

### Stata Scripts

```stata
// Set working directory
cd "/path/to/ds4bolivia"

// Run scripts in sequence
do code/010_add_poly_id_and____.do
do code/020_create_regional_identifiers_dataset.do
// ... etc
```

### Python Scripts

```python
python code/satellite_data_merger.py
```

### JavaScript/GEE Scripts

1. Open [Google Earth Engine Code Editor](https://code.earthengine.google.com/)
2. Copy and paste the script content
3. Update asset paths if necessary
4. Click "Run"
5. Export results to Google Drive

## Project Documentation

For more information about the research project and methodology:

- **Video Introduction**: [Project Overview](https://www.loom.com/share/07206f02b269485293ac7c8ad4df3c7f)
- **Computational Environment**: [Deepnote Notebooks](https://deepnote.com/project/project2021o-Bolivia-esda-HABNFWMYQ8CWOKKwDrJrTQ)

## Collaborators

- Carlos Mendez (carlos@gsid.nagoya-u.ac.jp, Nagoya University)
- Erick Gonzales (erick.gonzalesrocha@un.org, United Nations Office for Disaster Risk Reduction)
- Pedro Leoni (pedroleoni1605@gmail.com)

## References

- [Anselin, L., Sridharan, S., & Gholston, S. (2007). Using exploratory spatial data analysis to leverage social indicator databases](https://kami.app/NduBfCB3hNln)
- [Mendez, C., & Gonzales, E. (2021). Human Capital Constraints, Spatial Dependence, and Regionalization in Bolivia](https://doi.org/10.18800/economia.202101.007)
- [Geographic Data Science with Python](https://geographicdata.science/book/intro.html)
- [GeoDa Workbook](https://geodacenter.github.io/documentation.html)

## Data Sources

- [Andersen, L. E., Canelas, S., Gonzales, A., Peñaranda, L. (2020) Atlas Municipal de los ODS Bolivia 2020](https://atlas.sdsnbolivia.org)
