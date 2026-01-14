# DS4Bolivia: A Data Science Repository to Study GeoSpatial Development in Bolivia

This repository hosts a curated collection of spatial and socio-economic datasets for the 339 municipalities of Bolivia. It is designed to facilitate research in spatial econometrics, sustainable development (SDGs), and satellite-based machine learning.

## 📊 Dataset Overview

The data is organized into three main categories, all linked by a unique identifier (`asdf_id`).

| Dataset Category | File Path | Description | Join Key |
| :--- | :--- | :--- | :--- |
| **Region Names** | `/regionNames/regionNames.csv` | Administrative metadata (Municipality names, Department names). | `asdf_id` |
| **Socio-Economic** | `/sdg/sdg.csv` | Sustainable Development Goal (SDG) indices and poverty metrics. | `asdf_id` |
| **Satellite Features** | `/satelliteEmbeddings/satelliteEmbeddings2017.csv` | Feature vectors (embeddings) extracted from daytime satellite imagery. | `asdf_id` |
| **Spatial Vector** | `/maps/bolivia339geoqueryOpt.geojson` | Geometric boundaries (Polygons) for all municipalities. | `asdf_id` |

> **⚠️ Important Note on Identifiers:** > The primary key for joining all datasets in this repository is **`asdf_id`**.  
> While `mun_id` (standard government code) is present in the administrative data, `asdf_id` ensures consistency across the satellite embeddings and optimized map files provided here.

---

## 🚀 Quick Start: Run in Google Colab

You can run the examples below immediately in the cloud without installing anything locally.

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/notebooks/empty.ipynb)

### Example 1: Integrating Attribute Data
This script demonstrates how to merge the administrative names, socio-economic indicators, and satellite machine learning features into a single analytical dataframe.

```python
import pandas as pd

# -----------------------------------------------------------------------------
# 1. SETUP: Define Source URLs
# We use the raw GitHub URL to stream data directly into Colab/Pandas.
# -----------------------------------------------------------------------------
REPO_URL = "[https://raw.githubusercontent.com/quarcs-lab/ds4bolivia/master](https://raw.githubusercontent.com/quarcs-lab/ds4bolivia/master)"

url_names = f"{REPO_URL}/regionNames/regionNames.csv"
url_sdg = f"{REPO_URL}/sdg/sdg.csv"
url_emb = f"{REPO_URL}/satelliteEmbeddings/satelliteEmbeddings2017.csv"

# -----------------------------------------------------------------------------
# 2. LOAD: Read CSVs
# -----------------------------------------------------------------------------
print("Loading datasets...")
df_names = pd.read_csv(url_names)
df_sdg = pd.read_csv(url_sdg)
df_embeddings = pd.read_csv(url_emb)

# -----------------------------------------------------------------------------
# 3. MERGE: Combine Dataframes
# Methodology: We use an 'inner' merge on 'asdf_id'. This ensures we only
# keep rows that exist in all datasets.
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
df_final[['mun', 'dep', 'index_sdg1', '0', '1', '2']].head()
```

### Example 2: Integrating Spatial and Attribute Data
This script takes the merged data from Example 1 and attaches it to the municipality geometries (GeoJSON) for spatial analysis and plotting.


```python
# !pip install geopandas matplotlib  # Uncomment if running locally

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
# 2. SPATIAL JOIN
# Merge the spatial dataframe (gdf) with the attribute dataframe (df_final).
# 'asdf_id' must represent the same concept in both files.
# -----------------------------------------------------------------------------
# Ensure the key is an integer in the GeoDataFrame to match the CSVs
gdf_boundaries['asdf_id'] = gdf_boundaries['asdf_id'].astype(int)

# Merge
gdf_bolivia = gdf_boundaries.merge(df_final, on='asdf_id', how='inner')

# -----------------------------------------------------------------------------
# 3. VISUALIZATION
# Plot the "No Poverty" SDG Index (SDG 1)
# -----------------------------------------------------------------------------
fig, ax = plt.subplots(1, 1, figsize=(12, 10))

gdf_bolivia.plot(
    column='index_sdg1',    # Variable to map
    cmap='viridis',         # Color palette
    linewidth=0.1,          # Border width
    edgecolor='white',      # Border color
    legend=True,
    legend_kwds={'label': "SDG 1 Index (No Poverty)", 'orientation': "horizontal"},
    ax=ax
)

ax.set_title("Bolivia: SDG 1 Index by Municipality", fontsize=15)
ax.set_axis_off()           # Turn off lat/lon axis numbers
plt.show()
```

## 📜 Citation

If you use this repository in your research, please cite it using the following metadata.

### APA Format
Mendez, C., Gonzales, E., & Leoni, P. (2024). *DS4Bolivia: A Data Science Repository to Study GeoSpatial Development in Bolivia* [Data set]. GitHub. https://github.com/quarcs-lab/ds4bolivia

### BibTeX Format
```bibtex
@misc{ds4bolivia2024,
  author = {Mendez, Carlos and Gonzales, Erick and Leoni, Pedro},
  title = {{DS4Bolivia}: A Data Science Repository to Study GeoSpatial Development in Bolivia},
  year = {2024},
  publisher = {GitHub},
  journal = {GitHub repository},
  howpublished = {\url{[https://github.com/quarcs-lab/ds4bolivia](https://github.com/quarcs-lab/ds4bolivia)}}
}
```

## Collaborators

- Carlos Mendez  (carlos@gsid.nagoya-u.ac.jp, Nagoya University)
- Erick Gonzales (erick.gonzalesrocha@un.org, United Nations Office for Disaster Risk Reduction)
- Pedro Leoni (pedroleoni1605@gmail.com)

## Original data source

- [Andersen, L. E., Canelas, S., Gonzales, A., Peñaranda, L. (2020) Atlas municipal de los Objetivos de Desarrollo Sostenible en Bolivia 2020. La Paz: Universidad Privada Boliviana, SDSN Bolivia](https://atlas.sdsnbolivia.org)

