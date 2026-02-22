# Computational Notebooks

## Overview

This directory contains Jupyter notebooks with step-by-step tutorials for exploratory spatial data analysis (ESDA), machine learning, and poverty prediction using Bolivia's municipal development data and satellite imagery.

## Files

### Spatial Analysis Notebooks

#### esda.ipynb

**Exploratory Spatial Data Analysis (ESDA)**

An interactive tutorial demonstrating spatial analysis techniques using Bolivia's SDG data. This notebook is designed for researchers and students learning spatial econometrics and geographic data science.

**Topics Covered:**
- Global spatial autocorrelation (Moran's I)
- Local spatial autocorrelation (LISA statistics)
- Spatial clustering and outlier detection
- Choropleth mapping
- Spatial weights matrices

**Key Concepts:**
- Spatial dependence and autocorrelation
- Hot spots and cold spots identification
- Spatial lag and spatial error models
- GeoPandas and PySAL libraries

**Run in Google Colab:**

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/quarcs-lab/ds4bolivia/blob/master/notebooks/esda.ipynb)

#### eda_esda.ipynb

**Extended Exploratory Data Analysis and Spatial Analysis**

A comprehensive notebook combining traditional exploratory data analysis with spatial methods. Includes additional visualizations, statistical summaries, and advanced spatial analysis techniques.

**Run in Google Colab:**

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/quarcs-lab/ds4bolivia/blob/master/notebooks/eda_esda.ipynb)

---

## Prerequisites

To run these notebooks, you need:

```python
# Core libraries
pandas
numpy
matplotlib
seaborn

# Spatial analysis
geopandas
pysal
libpysal
esda
splot

# Machine learning
scikit-learn
```

## Jupytext and MyST Markdown

All notebooks are managed with [Jupytext](https://jupytext.readthedocs.io/) using [MyST Markdown](https://myst-parser.readthedocs.io/) as the source format. Each `.ipynb` file is paired with a `.md` file that serves as the human-readable, version-control-friendly source.

**Editing workflow:**

1. Edit the `.md` file (the source of truth)
2. Sync changes to the `.ipynb` file:

   ```bash
   uv run jupytext --sync notebooks/<notebook>.md
   ```

3. Or sync all notebooks at once:

   ```bash
   uv run jupytext --sync notebooks/*.md
   ```

**Opening `.md` files as notebooks:**

With Jupytext installed, Jupyter can open `.md` files directly as notebooks. You can also convert manually:

```bash
uv run jupytext --to notebook notebooks/<notebook>.md
```

**Note:** Both `.md` and `.ipynb` files are tracked in git. The `.md` files produce cleaner diffs for code review.

## Usage

You can run these notebooks in three ways:

1. **Google Colab** (Recommended): Click the badge above to run in the cloud without installation
2. **Local Jupyter**: Clone the repository and run `uv run jupyter notebook` in this directory
3. **Deepnote/Other Cloud Platforms**: Import the notebook files

## Learning Path

For best results, follow this sequence:

### For Spatial Analysis

1. Start with [esda.ipynb](esda.ipynb) to learn basic spatial analysis
2. Review the main [README](../README.md) for data integration examples
3. Explore [eda_esda.ipynb](eda_esda.ipynb) for advanced techniques

## Data Used

These notebooks use datasets from this repository:

- [regionNames/](../regionNames/) - Administrative names and identifiers
- [sdg/](../sdg/) - SDG composite indices
- [sdgVariables/](../sdgVariables/) - Granular SDG indicators (64 variables)
- [satelliteEmbeddings/](../satelliteEmbeddings/) - 64-dimensional satellite features
- [maps/](../maps/) - Municipal boundaries (GeoJSON)
- [datasets/](../datasets/) - Pre-merged analytical datasets

All data is loaded directly from GitHub URLs, so no local download is required.

## Key Variables

### Poverty Indicators
- `index_sdg1` - Composite SDG 1 Index (No Poverty)
- `sdg1_1_eepr` - **Extreme energy poverty rate** (% of houses, 2016) ⭐
- `sdg1_1_ubn` - Unsatisfied basic needs (%)
- `sdg1_2_mpi` - Multidimensional poverty index

### Energy Indicators
- `index_sdg7` - Composite SDG 7 Index (Affordable Energy)
- `sdg7_1_ec` - Electricity coverage (% of population)
- `sdg7_1_rec` - Residential electricity consumption per capita
- `sdg7_1_cce` - Clean cooking energy (% of households)

### Satellite Features
- `A00` to `A63` - 64-dimensional embeddings from Google Earth Engine
- Derived from daytime satellite imagery at 10m resolution
- Aggregated to municipal boundaries

## References

For methodological background, see:

- [Anselin, L. (2020). ESDA with PySAL](https://geodacenter.github.io/documentation.html)
- [Rey, S., Arribas-Bel, D., & Wolf, L. J. (2020). Geographic Data Science with Python](https://geographicdata.science/book/intro.html)
- [Mendez, C., & Gonzales, E. (2021). Human Capital Constraints, Spatial Dependence, and Regionalization in Bolivia](https://doi.org/10.18800/economia.202101.007)
- [Andersen, L. E., Canelas, S., Gonzales, A., Peñaranda, L. (2020). Atlas municipal de los Objetivos de Desarrollo Sostenible en Bolivia 2020](https://atlas.sdsnbolivia.org)

## Citation

If you use these notebooks in your research, please cite:

```
Mendez, C., Gonzales, E., Leoni, P., Andersen, L., Peralta, H. (2026).
DS4Bolivia: A Data Science Repository to Study GeoSpatial Development in Bolivia
[Data set]. GitHub. https://github.com/quarcs-lab/ds4bolivia
```
