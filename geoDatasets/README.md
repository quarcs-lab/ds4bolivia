# Geospatial Datasets

## Overview

This directory is designated for geospatial datasets in various GIS formats (GeoJSON, Shapefile, GeoPackage, etc.). Currently, the main geospatial data is stored in the [maps/](../maps/) directory.

## Current Status

This directory is currently empty. Geospatial files are located in:

- **[maps/](../maps/)** - Contains municipal boundary files in GeoJSON format

## Planned Content

Future geospatial datasets may include:

- Raster layers (land cover, elevation, climate)
- Point datasets (infrastructure, facilities, landmarks)
- Additional administrative boundaries (departments, provinces)
- Derived spatial products (buffers, centroids, grids)

## Working with Geospatial Data

For spatial analysis using this repository's data, refer to:

- **Boundary files**: [maps/bolivia339geoqueryOpt.geojson](../maps/bolivia339geoqueryOpt.geojson) - Optimized municipal boundaries
- **Full boundaries**: [maps/bolivia339geoqueryFull.geojson](../maps/bolivia339geoqueryFull.geojson) - Full-resolution boundaries
- **Python notebooks**: [notebooks/](../notebooks/) - Examples of spatial analysis
- **Interactive apps**: [apps/](../apps/) - Web-based visualization

## Loading Spatial Data

You can run the examples below in [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/notebooks/empty.ipynb)

```python
import geopandas as gpd

# Load municipal boundaries
url = "https://raw.githubusercontent.com/quarcs-lab/ds4bolivia/master/maps/bolivia339geoqueryOpt.geojson"
gdf = gpd.read_file(url)

# Join with attribute data
import pandas as pd
df_sdg = pd.read_csv("../sdg/sdg.csv")
gdf = gdf.merge(df_sdg, on='asdf_id', how='inner')

# Create choropleth map
gdf.plot(column='index_sdg1', legend=True)
```

## Coordinate Reference System

All spatial data in this repository uses:
- **CRS**: EPSG:4326 (WGS 84)
- **Units**: Decimal degrees

## Join Key

Use `asdf_id` to join spatial data with attribute datasets in this repository.
