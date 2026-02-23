
![](https://github.com/quarcs-lab/ds4bolivia/blob/master/images/cover2.jpg?raw=true)

# DS4Bolivia: A Data Science Repository to Study Regional Development in Bolivia


[Welcome to **DS4Bolivia**!](https://github.com/quarcs-lab/ds4bolivia) This project aggregates spatial and socio-economic datasets, interactive apps, and computational workflows focused on  **339 municipalities** in Bolivia. It is designed to bridge the gap between spatial analysis and sustainable development goals (SDGs).

This repository is organized for researchers and data scientists interested in:

* **Spatial Econometrics:** Understanding regional disparities, growth, and clustering.
* **Spatial Machine Learning:** Utilizing satellite imagery (Earth Observation) for predictive modeling.
* **Sustainable Development:** Tracking SDG indicators at a granular local level.

---

## 🖥️ Interactive Apps

Explore the data without writing code. These applications visualize the space-time dynamics of key development indicators.

* [Space-time dynamics of population, luminosity, land cover and GDP (2013-2019)](https://carlos-mendez.projects.earthengine.app/view/geoexplorer1v100bolivia): Visualize the evolution of population density, night-time lights, land cover changes, and GDP estimates across Bolivian municipalities in 2013 and 2019.

---

## 🐍 Cloud-based Computational Notebooks

Step-by-step tutorials to help you reproduce our analysis. These notebooks utilize Python libraries such as `GeoPandas`, `PySAL`, and `scikit-learn`.

### Spatial Analysis Notebooks

* **[Exploratory Data Analysis (EDA)](https://colab.research.google.com/github/quarcs-lab/ds4bolivia/blob/master/notebooks/eda.ipynb)**
  * *Focus:* Descriptive statistics, regional comparisons, population treemaps, and nighttime lights vs development.
  * *Key Concepts:* Data exploration, interactive visualizations, Plotly.

* **[Introduction to Exploratory Spatial Data Analysis (ESDA)](https://colab.research.google.com/github/quarcs-lab/ds4bolivia/blob/master/notebooks/esda.ipynb)**
  * *Focus:* Learn how to detect spatial clusters and outliers using Global and Local Moran's I.
  * *Key Concepts:* Spatial Autocorrelation, LISA Statistics, Choropleth Mapping.

* **[Spatial Distribution & Dependence](https://colab.research.google.com/github/quarcs-lab/ds4bolivia/blob/master/notebooks/esda_dependence.ipynb)**
  * *Focus:* Map classification schemes, spatial weights, and measures of spatial autocorrelation.
  * *Key Concepts:* BoxPlot/Fisher-Jenks breaks, KNN weights, Global Moran's I, LISA clusters.

* **[Spatial Inequality](https://colab.research.google.com/github/quarcs-lab/ds4bolivia/blob/master/notebooks/esda_inequality.ipynb)**
  * *Focus:* Measuring regional inequality with decomposition by department.
  * *Key Concepts:* Theil index (between/within), Gini coefficient, Spatial Gini.

* **[Spatial Heterogeneity (GWR & MGWR)](https://colab.research.google.com/github/quarcs-lab/ds4bolivia/blob/master/notebooks/esda_heterogeneity.ipynb)**
  * *Focus:* Spatially varying relationships between nighttime lights and development.
  * *Key Concepts:* Geographically Weighted Regression, Multiscale GWR.

* **[Extended EDA + Spatial Analysis](https://colab.research.google.com/github/quarcs-lab/ds4bolivia/blob/master/notebooks/eda_esda.ipynb)**
  * *Focus:* Comprehensive analysis combining traditional EDA with advanced spatial methods.
  * *Key Concepts:* Statistical summaries, visualizations, spatial clustering, bivariate analysis.

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
Mendez, C., Gonzales, E., Leoni, P., Andersen, L., Peralta, H. (2026). DS4Bolivia: A Data Science Repository to Study Regional Development in Bolivia [Data set]. GitHub. https://github.com/quarcs-lab/ds4bolivia

### BibTeX Format

```bibtex
@misc{ds4bolivia2026,
  author = {Mendez, Carlos and Gonzales, Erick and Leoni, Pedro and Andersen, Lykke and Peralta, Hendrix},
  title = {{DS4Bolivia}: A Data Science Repository to Study Regional Development in Bolivia},
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

### Local Development Setup

To run the notebooks and scripts locally, this project uses [UV](https://docs.astral.sh/uv/) for Python package management.

**1. Install UV** (skip if already installed):

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

**2. Clone and set up the environment:**

```bash
git clone https://github.com/quarcs-lab/ds4bolivia.git
cd ds4bolivia
uv sync
```

This creates a `.venv/` directory and installs all dependencies from the lock file.

**3. Run notebooks:**

```bash
uv run jupyter notebook
```

**4. Run Python scripts:**

```bash
uv run python code/run_poverty_prediction.py
```

> **Note:** The Jupyter notebooks are also designed to run in [Google Colab](https://colab.research.google.com/) without any local setup. Click the "Open in Colab" badges throughout this README.

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


## 🤝 Contributing

Find an error? Have a suggestion? Want to contribute? Submit an [issue](https://github.com/quarcs-lab/ds4bolivia/issues) or join the [discussion](https://github.com/quarcs-lab/ds4bolivia/discussions) via GitHub.



