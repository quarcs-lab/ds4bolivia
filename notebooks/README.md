# Computational Notebooks

## Overview

This directory contains Jupyter notebooks with step-by-step tutorials for exploratory spatial data analysis (ESDA) and exploratory data analysis (EDA) of Bolivia's municipal development data.

## Files

### esda.ipynb

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

### eda_esda.ipynb

**Extended Exploratory Data Analysis and Spatial Analysis**

A comprehensive notebook combining traditional exploratory data analysis with spatial methods. Includes additional visualizations, statistical summaries, and advanced spatial analysis techniques.

**Run in Google Colab:**

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/quarcs-lab/ds4bolivia/blob/master/notebooks/eda_esda.ipynb)

## Prerequisites

To run these notebooks, you need:

```python
# Python libraries
geopandas
pandas
matplotlib
seaborn
pysal
libpysal
esda
splot
```

## Usage

You can run these notebooks in three ways:

1. **Google Colab** (Recommended): Click the badge above to run in the cloud without installation
2. **Local Jupyter**: Clone the repository and run `jupyter notebook` in this directory
3. **Deepnote/Other Cloud Platforms**: Import the notebook files

## Learning Path

For best results, follow this sequence:

1. Start with [esda.ipynb](esda.ipynb) to learn basic spatial analysis
2. Review the main [README](../README.md) for data integration examples
3. Explore [eda_esda.ipynb](eda_esda.ipynb) for advanced techniques

## Data Used

These notebooks use datasets from this repository:

- [regionNames/](../regionNames/) - Administrative names
- [sdg/](../sdg/) - SDG indices
- [maps/](../maps/) - Municipal boundaries (GeoJSON)

All data is loaded directly from GitHub URLs, so no local download is required.

## References

For methodological background, see:

- [Anselin, L. (2020). ESDA with PySAL](https://geodacenter.github.io/documentation.html)
- [Rey, S., Arribas-Bel, D., & Wolf, L. J. (2020). Geographic Data Science with Python](https://geographicdata.science/book/intro.html)
- [Mendez, C., & Gonzales, E. (2021). Human Capital Constraints, Spatial Dependence, and Regionalization in Bolivia](https://doi.org/10.18800/economia.202101.007)
