
![](https://github.com/quarcs-lab/ds4bolivia/blob/master/images/cover.jpg?raw=true)

# DS4Bolivia: A Data Science Repository to Study GeoSpatial Development in Bolivia


[Welcome to **DS4Bolivia**!](https://github.com/quarcs-lab/ds4bolivia) This project aggregates spatial and socio-economic datasets, interactive dashboards, and computational workflows focused on  **339 municipalities** in Bolivia. It is designed to bridge the gap between spatial analysis and sustainable development goals (SDGs).

This repository is organized for researchers and data scientists interested in:

* **Spatial Econometrics:** Understanding regional disparities, growth, and clustering.
* **Spatial Machine Learning:** Utilizing satellite imagery (Earth Observation) for predictive modeling.
* **Sustainable Development:** Tracking SDG indicators at a granular local level.

---

## 🖥️ Interactive Geospatial Dashboards

Explore the data without writing code. These applications visualize the space-time dynamics of key development indicators.

* [Space-time dynamics of population, luminosity, land cover and GDP (2013-2019)](https://carlos-mendez.projects.earthengine.app/view/geoexplorer1v100bolivia): Visualize the evolution of population density, night-time lights, land cover changes, and GDP estimates across Bolivian municipalities in 2013 and 2019.

---

## 🐍 Cloud-based Computational Notebooks

Step-by-step tutorials to help you reproduce our analysis. These notebooks utilize Python libraries such as `GeoPandas`, `PySAL`, and `scikit-learn`.

### Spatial Analysis Notebooks

* **[Introduction to Exploratory Spatial Data Analysis (ESDA)](https://colab.research.google.com/github/quarcs-lab/ds4bolivia/blob/master/notebooks/esda.ipynb)**
  * *Focus:* Learn how to detect spatial clusters and outliers using Global and Local Moran's I.
  * *Key Concepts:* Spatial Autocorrelation, LISA Statistics, Choropleth Mapping.

* **[Extended Exploratory Data Analysis and Spatial Analysis](https://colab.research.google.com/github/quarcs-lab/ds4bolivia/blob/master/notebooks/eda_esda.ipynb)**
  * *Focus:* Comprehensive analysis combining traditional EDA with advanced spatial methods.
  * *Key Concepts:* Statistical summaries, visualizations, spatial clustering, bivariate analysis.

### Machine Learning & Poverty Prediction Notebooks

* **[Predicting General Poverty (SDG 1)](https://colab.research.google.com/github/quarcs-lab/ds4bolivia/blob/master/notebooks/predict_poverty_rf.ipynb)**
  * *Focus:* Random Forest model predicting poverty index using satellite embeddings.
  * *Key Features:* Feature importance analysis, spatial visualization, model evaluation.

* **[Predicting Energy Poverty (SDG 7)](https://colab.research.google.com/github/quarcs-lab/ds4bolivia/blob/master/notebooks/predict_energy_rf.ipynb)**
  * *Focus:* Predict energy access using satellite imagery features.
  * *Key Features:* Comparison with general poverty, urban vs rural analysis.

* **[Predicting Extreme Energy Poverty Rate](https://colab.research.google.com/github/quarcs-lab/ds4bolivia/blob/master/notebooks/predict_extreme_energy_poverty_rf.ipynb)** ⭐ *Recommended*
  * *Focus:* Direct measurement of energy poverty (% of houses in extreme energy poverty).
  * *Key Features:* Best cross-validation performance, policy-relevant indicators.

* **[Predicting Municipal Sustainable Development Index (IMDS)](https://colab.research.google.com/github/quarcs-lab/ds4bolivia/blob/master/notebooks/predict_imds_rf.ipynb)**
  * *Focus:* Composite index aggregating all SDG indicators into a single development score.
  * *Key Features:* Urban-rural prediction patterns, distributed feature importance, student exercises.

### Advanced ML & Comparative Analysis Notebooks

* **[IMDS with Optuna Hyperparameter Tuning](https://colab.research.google.com/github/quarcs-lab/ds4bolivia/blob/master/notebooks/predict_imds_rf_optuna.ipynb)**
  * *Focus:* Bayesian hyperparameter optimization using Optuna.
  * *Key Features:* TPE sampler, 100 trials, optimization visualization, comparison with baseline.

* **[IMDS with Nested Cross-Validation](https://colab.research.google.com/github/quarcs-lab/ds4bolivia/blob/master/notebooks/predict_imds_rf_optuna_cv.ipynb)**
  * *Focus:* Rigorous evaluation using nested CV (double cross-validation).
  * *Key Features:* 5-fold outer × 5-fold inner CV, confidence intervals, hyperparameter stability analysis.

* **[Comparative SDG Prediction with XGBoost (GPU)](https://colab.research.google.com/github/quarcs-lab/ds4bolivia/blob/master/notebooks/predict_all_sdgs_xgb_optuna_cv.ipynb)** ⭐ *Advanced*
  * *Focus:* Predict ALL 16 SDG indicators to compare predictability from satellite imagery.
  * *Key Features:* XGBoost with GPU acceleration (A100/T4), Optuna tuning, nested CV, feature importance heatmaps, publication-ready results.
  * *Research Question:* Which SDGs are most predictable from satellite data?

See [notebooks/README.md](notebooks/README.md) for complete documentation and learning paths.

---

## 💾 Spatially-Explicit Datasets

Curated datasets ready for analysis. These files are pre-processed to align with Bolivian municipal boundaries. All datasets use **`asdf_id`** as the primary join key.

### Core Datasets

| Dataset | Description | Variables | Documentation |
| :--- | :--- | :--- | :--- |
| **[regionNames](regionNames/)** | Administrative metadata for 339 municipalities | Municipality names, department names, IDs | [README](regionNames/README.md) |
| **[sdg](sdg/)** | Aggregated SDG indices (0-100 scale) | 15 composite SDG indices + overall development index | [README](sdg/README.md) |
| **[sdgVariables](sdgVariables/)** | Detailed SDG indicators | 64 granular variables underlying the SDG indices | [README](sdgVariables/README.md) |
| **[pop](pop/)** | Population time series | Annual population (2001-2020) | [README](pop/README.md) |
| **[ntl](ntl/)** | Night-time lights data | Log NTL per capita + trend components (2012-2020) | [README](ntl/README.md) |
| **[satelliteEmbeddings](satelliteEmbeddings/)** | Satellite imagery features | 64-dimensional embeddings from Google Earth Engine (2017) | [README](satelliteEmbeddings/README.md) |
| **[datasets](datasets/)** | Pre-merged datasets | **SDGs + Satellite Embeddings** - Ready for machine learning | [README](datasets/README.md) |

### Spatial Data

| Resource | Description | Documentation |
| :--- | :--- | :--- |
| **[maps](maps/)** | Optimized & full-resolution municipal boundaries (GeoJSON) | Directory |
| **[geoDatasets](geoDatasets/)** | Placeholder for additional raster/vector spatial data | [README](geoDatasets/README.md) |

### Code & Applications

| Resource | Description | Documentation |
| :--- | :--- | :--- |
| **[code](code/)** | Data processing scripts (Stata, Python, JavaScript/GEE) + ML prediction models | [README](code/README.md) |
| **[notebooks](notebooks/)** | Jupyter tutorials for ESDA, spatial analysis, and poverty prediction ML | [README](notebooks/README.md) |
| **[apps](apps/)** | Interactive GeoExplorer web application code | [README](apps/README.md) |

---

## 📜 Citation

If you use this repository in your research, please cite it using the following metadata.

### APA Format
Mendez, C., Gonzales, E., Leoni, P., Andersen, L., Peralta, H. (2026). DS4Bolivia: A Data Science Repository to Study GeoSpatial Development in Bolivia [Data set]. GitHub. https://github.com/quarcs-lab/ds4bolivia

### BibTeX Format

```bibtex
@misc{ds4bolivia2026,
  author = {Mendez, Carlos and Gonzales, Erick and Leoni, Pedro and Andersen, Lykke and Peralta, Hendrix},
  title = {{DS4Bolivia}: A Data Science Repository to Study GeoSpatial Development in Bolivia},
  year = {2026},
  publisher = {GitHub},
  journal = {GitHub repository},
  howpublished = {\url{https://github.com/quarcs-lab/ds4bolivia}}
}
```

---

## 🚀 Getting Started

### Quick Links to Dataset Documentation

Each dataset has comprehensive documentation with variable dictionaries, usage examples, and Python code snippets:

* **[regionNames/README.md](regionNames/README.md)** - Administrative identifiers and municipality names
* **[sdg/README.md](sdg/README.md)** - SDG composite indices with descriptions of all 15+ goals
* **[sdgVariables/README.md](sdgVariables/README.md)** - Detailed SDG indicators (64 variables) organized by goal
* **[pop/README.md](pop/README.md)** - Population data (2001-2020) with growth analysis examples
* **[ntl/README.md](ntl/README.md)** - Night-time lights data with HP-filter trend components
* **[satelliteEmbeddings/README.md](satelliteEmbeddings/README.md)** - Deep learning features from satellite imagery
* **[datasets/README.md](datasets/README.md)** - Pre-merged SDG + satellite data ready for ML

### Construct Your Own Dataset

The datasets are organized into modules, all linked by a unique identifier (`asdf_id`). You can combine any datasets to create custom analytical files.

| Dataset Category | File Path | Description | Join Key |
| :--- | :--- | :--- | :--- |
| **Region Names** | `/regionNames/regionNames.csv` | Administrative metadata (Municipality names, Department names) | `asdf_id` |
| **Socio-Economic** | `/sdg/sdg.csv` | Sustainable Development Goal (SDG) indices and poverty metrics | `asdf_id` |
| **Detailed SDG** | `/sdgVariables/sdgVariables.csv` | 64 granular SDG indicators underlying the composite indices | `asdf_id` |
| **Population** | `/pop/pop.csv` | Annual population estimates (2001-2020) | `asdf_id` |
| **Night-time Lights** | `/ntl/ln_NTLpc.csv` | Log NTL per capita + HP-filtered trends (2012-2020) | `asdf_id` |
| **Satellite Features** | `/satelliteEmbeddings/satelliteEmbeddings2017.csv` | 64-dimensional embeddings from satellite imagery | `asdf_id` |
| **Spatial Vector** | `/maps/bolivia339geoqueryOpt.geojson` | Geometric boundaries (Polygons) for all municipalities | `asdf_id` |
| **Pre-merged** | `/datasets/sdgs_satelliteEmbeddings2017.csv` | SDGs + Satellite Embeddings combined | `asdf_id` |

> **⚠️ Important Note on Identifiers:**
> The primary key for joining all datasets in this repository is **`asdf_id`**.
> While `mun_id` (standard government code) is present in the administrative data, `asdf_id` ensures consistency across the satellite embeddings and optimized map files provided here. Always ensure this column is treated as an `int` or `string` consistently across both dataframes before merging.

---

You can run the examples below immediately in [Google Colab](https://colab.research.google.com/notebooks/empty.ipynb).

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/notebooks/empty.ipynb)

### Example 1: Integrating Attribute Data
This script demonstrates how to merge the administrative names, socio-economic indicators, and satellite machine learning features into a single analytical dataframe.

```python
import pandas as pd

# -----------------------------------------------------------------------------
# 1. SETUP: Define Source URLs
# We use the raw GitHub URL to stream data directly into Colab/Pandas.
# -----------------------------------------------------------------------------
REPO_URL = "https://raw.githubusercontent.com/quarcs-lab/ds4bolivia/master"

url_names = f"{REPO_URL}/regionNames/regionNames.csv"
url_sdg = f"{REPO_URL}/sdg/sdg.csv"
url_emb = f"{REPO_URL}/satelliteEmbeddings/satelliteEmbeddings2017.csv"

# -----------------------------------------------------------------------------
# 2. LOAD: Read CSVs
# -----------------------------------------------------------------------------
print("Loading datasets...")
df_names      = pd.read_csv(url_names)
df_sdg        = pd.read_csv(url_sdg)
df_embeddings = pd.read_csv(url_emb)

# -----------------------------------------------------------------------------
# 3. MERGE: Combine Dataframes
# -----------------------------------------------------------------------------
# Step A: Attach SDG data to Names
df_merged_step1 = pd.merge(df_names, df_sdg, on='asdf_id', how='inner')

# Step B: Attach Satellite Embeddings to the result
df_final = pd.merge(df_merged_step1, df_embeddings, on='asdf_id', how='inner')

# -----------------------------------------------------------------------------
# 4. VERIFY
# -----------------------------------------------------------------------------
print(f"Merge Complete.")
print(f"Original Municipalities: {len(df_names)}")
print(f"Final Merged Rows:       {len(df_final)}")
print(f"Total Columns:           {len(df_final.columns)}")

# Display the first few rows (names + first few embedding columns)
display(df_final[['mun', 'dep', 'index_sdg1', 'A00', 'A01', 'A02']].head())
```

### Example 2: Integrating Spatial and Attribute Data
This script takes the merged data from Example 1 and attaches it to the municipality geometries (GeoJSON) for spatial analysis and plotting.

```python

import geopandas as gpd
import matplotlib.pyplot as plt

# -----------------------------------------------------------------------------
# 1. LOAD SPATIAL DATA
# We load the optimized GeoJSON file containing municipality boundaries.
# -----------------------------------------------------------------------------
geojson_url = f"{REPO_URL}/maps/bolivia339geoqueryOpt.geojson"
print("Loading GeoJSON map...")
gdf_boundaries = gpd.read_file(geojson_url)

# -----------------------------------------------------------------------------
# 2. SPATIAL DATA PREPARATION
# GeoJSON often loads IDs as objects/strings, while CSVs load as integers.
# -----------------------------------------------------------------------------
# Force 'asdf_id' to integer to match the pandas dataframe
gdf_boundaries['asdf_id'] = gdf_boundaries['asdf_id'].astype(int)

# -----------------------------------------------------------------------------
# 3. ATTRIBUTE JOIN
# Merge the spatial dataframe (gdf) with the attribute dataframe (df_final).
# This creates a 'GeoDataFrame' capable of spatial operations.
# -----------------------------------------------------------------------------
gdf_bolivia = gdf_boundaries.merge(df_final, on='asdf_id', how='inner')

# -----------------------------------------------------------------------------
# 4. VISUALIZATION (Choropleth Map)
# Plot the "No Poverty" SDG Index (SDG 1)
# -----------------------------------------------------------------------------
fig, ax = plt.subplots(1, 1, figsize=(12, 10))

gdf_bolivia.plot(
    column='index_sdg1',    # Variable to map
    cmap='viridis',         # Color palette (perceptually uniform)
    linewidth=0.1,          # Border width
    edgecolor='white',      # Border color
    legend=True,
    legend_kwds={'label': "SDG 1 Index (No Poverty)", 'orientation': "horizontal"},
    ax=ax
)

ax.set_title("Bolivia: SDG 1 Index by Municipality", fontsize=15)
ax.set_axis_off()           # Turn off lat/lon axis numbers for cleaner look
plt.show()
```



---

## Data sources

- SDG indicators are originally contructed by [Andersen, L. E., Canelas, S., Gonzales, A., Peñaranda, L. (2020) Atlas municipal de los Objetivos de Desarrollo Sostenible en Bolivia 2020. La Paz: Universidad Privada Boliviana, SDSN Bolivia](https://atlas.sdsnbolivia.org)




## 🤝 Contributing

We welcome contributions! If you are fixing a Coordinate Reference System (CRS) issue, adding a new spatial model, or uploading fresh data, please [submit a Pull Request](https://github.com/quarcs-lab/ds4bolivia/pulls).



