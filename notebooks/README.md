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

### Machine Learning & Poverty Prediction Notebooks

#### predict_poverty_rf.ipynb

**Predicting General Poverty (SDG 1) Using Satellite Embeddings**

Random Forest model to predict the SDG 1 Index (No Poverty) using 64-dimensional satellite imagery embeddings from Google Earth Engine.

**Key Features:**
- Data loading and merging from DS4Bolivia datasets
- Random Forest regression with 5-fold cross-validation
- Feature importance analysis (top 20 features)
- Model performance evaluation (R², RMSE, MAE)
- Spatial visualization of predictions and errors
- Comparison of actual vs predicted poverty levels

**Performance:**
- Test R²: 0.40 (explains 40% of variance)
- Test MAE: ±13.3 percentage points

**Run in Google Colab:**

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/quarcs-lab/ds4bolivia/blob/master/notebooks/predict_poverty_rf.ipynb)

#### predict_energy_rf.ipynb

**Predicting Energy Poverty (SDG 7) Using Satellite Embeddings**

Random Forest model to predict the SDG 7 Index (Affordable and Clean Energy) using satellite embeddings.

**Key Features:**
- Comparison with general poverty (SDG 1) patterns
- Correlation analysis: SDG 1 vs SDG 7 (r = 0.92)
- Identification of municipalities with unique energy poverty patterns
- Analysis of urban vs rural energy access disparities

**Performance:**
- Test R²: 0.35
- Test MAE: ±10.0 percentage points

**Run in Google Colab:**

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/quarcs-lab/ds4bolivia/blob/master/notebooks/predict_energy_rf.ipynb)

#### predict_extreme_energy_poverty_rf.ipynb

**Predicting Extreme Energy Poverty Rate Using Satellite Embeddings** ⭐ **Recommended**

Random Forest model to predict `sdg1_1_eepr` - the percentage of houses in extreme energy poverty (2016). This notebook uses a **direct measurement** rather than composite indices.

**Why This Variable?**
- Direct measurement: % of houses in extreme energy poverty
- Policy relevant: Directly actionable for electrification programs
- Clear interpretation: Easy to understand and communicate
- Better performance: Cross-validation R² = 0.57

**Key Features:**
- Analysis of 315 municipalities (24 with missing data)
- Correlation analysis with related poverty indicators
- Identification of systematic urban/rural prediction errors
- Top features: A43, A25, A23, A61, A62
- Only 36/64 features (56%) needed for 80% importance

**Performance:**
- Cross-validation R²: 0.57 (±0.08)
- Test R²: 0.22
- Test MAE: ±15.5 percentage points

**Critical Findings:**
- Urban centers systematically overpredicted (La Paz, Cochabamba, Oruro)
- Rural extreme poverty areas underpredicted (Cocapata, Anzaldo)
- Strong correlation with unsatisfied basic needs (r = 0.80)
- Negative correlation with electricity coverage (r = -0.66)

**Run in Google Colab:**

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/quarcs-lab/ds4bolivia/blob/master/notebooks/predict_extreme_energy_poverty_rf.ipynb)

---

### Supporting Documentation

#### ANALYSIS_COMPARISON.md

**Comparative Analysis: Poverty (SDG 1) vs Energy Poverty (SDG 7)**

Comprehensive comparison document analyzing the three prediction models:
- Model performance comparison table
- Feature importance analysis and overlap
- Correlation analysis between poverty dimensions
- Systematic prediction error patterns
- Unique energy poverty patterns identification
- Policy implications and recommendations

**Key Insights:**
- Both models explain 35-40% of variance
- Same municipalities appear as outliers across models
- Strong correlation (0.92) between general and energy poverty
- Urban/rural divide drives systematic errors
- Night-time lights data recommended for improvement

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

## Usage

You can run these notebooks in three ways:

1. **Google Colab** (Recommended): Click the badge above to run in the cloud without installation
2. **Local Jupyter**: Clone the repository and run `jupyter notebook` in this directory
3. **Deepnote/Other Cloud Platforms**: Import the notebook files

## Learning Path

For best results, follow this sequence:

### For Spatial Analysis:
1. Start with [esda.ipynb](esda.ipynb) to learn basic spatial analysis
2. Review the main [README](../README.md) for data integration examples
3. Explore [eda_esda.ipynb](eda_esda.ipynb) for advanced techniques

### For Machine Learning & Poverty Prediction:
1. Start with [predict_extreme_energy_poverty_rf.ipynb](predict_extreme_energy_poverty_rf.ipynb) (best performance, clearest interpretation)
2. Compare with [predict_poverty_rf.ipynb](predict_poverty_rf.ipynb) for general poverty patterns
3. Review [predict_energy_rf.ipynb](predict_energy_rf.ipynb) for energy-specific analysis
4. Read [ANALYSIS_COMPARISON.md](ANALYSIS_COMPARISON.md) for comprehensive insights

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

## Companion Scripts

Python scripts for running these analyses from the command line are available in [code/](../code/):
- `run_poverty_prediction.py`
- `run_energy_prediction.py`
- `run_extreme_energy_poverty.py`
