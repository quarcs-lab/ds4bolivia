# Comparative Analysis: Poverty (SDG 1) vs Energy Poverty (SDG 7)

## Executive Summary

This document compares two Random Forest models predicting different dimensions of poverty in Bolivia's 339 municipalities using satellite imagery embeddings.

---

## Model Performance Comparison

| Metric | SDG 1 (No Poverty) | SDG 7 (Affordable Energy) |
|--------|-------------------|---------------------------|
| **Cross-Val R²** | 0.3614 (±0.0685) | 0.2482 (±0.0978) |
| **Test R²** | 0.4025 | 0.3507 |
| **Test RMSE** | 17.4770 | 13.4261 |
| **Test MAE** | 13.3347 | 10.0262 |
| **Training R²** | 0.8503 | 0.8302 |
| **Overfitting Gap** | 0.4478 | 0.4795 |

### Key Observations:
- **SDG 1 (Poverty) is slightly easier to predict** (R² = 0.40 vs 0.35)
- Both models show **significant overfitting** (training R² ~0.83-0.85 vs test R² ~0.35-0.40)
- **Lower RMSE for SDG 7** due to different scale ranges
- Similar predictive challenges suggest satellite imagery captures **general socioeconomic patterns** but misses specific contextual factors

---

## Feature Importance Analysis

### SDG 1 (No Poverty) - Top 5 Features:
1. **A43** (0.0477)
2. **A59** (0.0386)
3. **A13** (0.0368)
4. **A07** (0.0358)
5. **A04** (0.0311)

### SDG 7 (Affordable Energy) - Top 5 Features:
1. **A13** (0.0467)
2. **A57** (0.0428)
3. **A59** (0.0427)
4. **A21** (0.0310)
5. **A52** (0.0247)

### Overlap Analysis:
- **Common features**: A13, A59 appear in both top 5 lists
- **Dimensionality**: Both need ~70% of features for 80% importance
  - SDG 1: 43/64 features (67.2%)
  - SDG 7: 45/64 features (70.3%)
- **Interpretation**: Similar embedding dimensions capture both poverty types, but with different weights

---

## Correlation Analysis

### SDG 1 vs SDG 7 Correlation: **0.9197**

This **very strong positive correlation** indicates:
- ✅ Energy poverty and general poverty are highly interconnected
- ✅ Municipalities with low general poverty tend to have better energy access
- ⚠️ But the correlation is not perfect (0.92 ≠ 1.0), suggesting **unique patterns**

---

## Prediction Error Analysis

### SDG 1 - Worst Overpredictions (Too Optimistic):
1. **Tinguipaya** (Potosí): Actual=3.60, Predicted=30.39 (Δ=-26.79)
2. **El Choro** (Oruro): Actual=0.06, Predicted=26.49 (Δ=-26.43)
3. **Poroma** (Chuquisaca): Actual=1.24, Predicted=27.05 (Δ=-25.81)

### SDG 7 - Worst Overpredictions (Too Optimistic):
1. **El Choro** (Oruro): Actual=26.03, Predicted=47.09 (Δ=-21.06)
2. **Tinguipaya** (Potosí): Actual=30.81, Predicted=49.57 (Δ=-18.76)
3. **Poroma** (Chuquisaca): Actual=24.95, Predicted=43.04 (Δ=-18.09)

**Pattern**: Same municipalities (El Choro, Tinguipaya, Poroma) appear in both lists!
- These are **remote, rural, high-altitude** municipalities
- Satellite imagery may not capture **extreme poverty** well
- Suggests need for **ground-truth verification** in these areas

### SDG 1 - Worst Underpredictions (Too Pessimistic):
1. **La Paz** (Capital): Actual=90.31, Predicted=31.50 (Δ=+58.81)
2. **Huachacalla** (Oruro): Actual=69.68, Predicted=26.08 (Δ=+43.60)
3. **Llallagua** (Potosí): Actual=60.48, Predicted=23.09 (Δ=+37.39)

### SDG 7 - Worst Underpredictions (Too Pessimistic):
1. **La Paz** (Capital): Actual=95.83, Predicted=49.19 (Δ=+46.64)
2. **Trinidad** (Beni): Actual=84.60, Predicted=54.32 (Δ=+30.28)
3. **Huachacalla** (Oruro): Actual=78.00, Predicted=47.77 (Δ=+30.23)

**Pattern**: Major urban centers (La Paz, Trinidad, Santa Cruz) are systematically underpredicted
- **Urban complexity** not captured by satellite embeddings alone
- Higher population density correlates with better services
- Suggests need for **urbanization metrics** as additional features

---

## Unique Energy Poverty Patterns

### 🔋 Good Energy BUT High General Poverty:
These municipalities have relatively good electricity access despite overall poverty:

| Municipality | Department | SDG 7 (Energy) | SDG 1 (Poverty) |
|--------------|-----------|----------------|-----------------|
| Coipasa | Oruro | 62.0 | 26.3 |
| Taraco | La Paz | 60.7 | 31.0 |
| Huarina | La Paz | 56.9 | 33.2 |
| Pari-Paria-Soracachi | Oruro | 56.6 | 25.5 |
| Puerto Pérez | La Paz | 55.6 | 26.3 |

**Hypothesis**: These may benefit from **grid connectivity** due to proximity to major routes, despite low income levels.

### ⚡ Poor Energy BUT Low General Poverty:
These municipalities have low energy access despite relatively better overall conditions:

| Municipality | Department | SDG 7 (Energy) | SDG 1 (Poverty) |
|--------------|-----------|----------------|-----------------|
| Antequera | Oruro | 45.1 | 52.7 |
| Carmen Rivero Tórrez | Santa Cruz | 49.0 | 50.2 |
| San Antonio de Lomerío | Santa Cruz | 25.7 | 49.7 |
| Moro Moro | Santa Cruz | 49.5 | 48.0 |
| San Miguel de Velasco | Santa Cruz | 44.8 | 42.5 |

**Hypothesis**: **Remote Santa Cruz** municipalities may have economic activity (agriculture, commerce) but lack **electrical infrastructure**.

---

## Insights & Recommendations

### Model Performance
1. ✅ **Both models explain 35-40% of variance** - moderate predictive power
2. ⚠️ **Significant overfitting** - need regularization or more data
3. ✅ **Satellite imagery captures general patterns** but misses local context

### Feature Engineering Needs
1. 🌙 **Night-time lights (NTL)** - Direct proxy for electricity usage
2. 🏙️ **Urbanization metrics** - Population density, built-up area
3. 🛣️ **Infrastructure data** - Road networks, grid connectivity
4. 📊 **Temporal features** - Multi-year trends, seasonality

### Policy Implications
1. **Targeted interventions** needed in:
   - Remote high-altitude areas (Tinguipaya, El Choro, Poroma)
   - Santa Cruz periphery with poor energy access
2. **Energy infrastructure investment** should prioritize:
   - Municipalities with low SDG 7 but moderate SDG 1
   - Areas distant from urban centers
3. **Data collection priorities**:
   - Ground-truth verification in extreme poverty areas
   - Infrastructure mapping (power lines, transformers)

### Next Steps for Model Improvement
1. **Ensemble methods**: Combine Random Forest with XGBoost, LightGBM
2. **Spatial cross-validation**: Account for spatial autocorrelation
3. **Multi-target learning**: Predict SDG 1 and SDG 7 jointly
4. **Explainable AI**: Use SHAP values to understand predictions
5. **Temporal dynamics**: Include multi-year satellite data

---

## Conclusion

Both poverty (SDG 1) and energy poverty (SDG 7) can be **partially predicted** from satellite imagery (R² ~0.35-0.40), but:

- ✅ Models capture **broad spatial patterns** across Bolivia
- ✅ Strong correlation (0.92) confirms interconnected nature of poverty dimensions
- ⚠️ Satellite data alone is **insufficient** for accurate predictions
- ⚠️ Urban centers and extreme poverty areas show **systematic prediction errors**
- 💡 **Combining satellite embeddings with NTL, infrastructure, and population data** is essential for operational use

---

## Citation

Mendez, C., Gonzales, E., Leoni, P., Andersen, L., Peralta, H. (2026). DS4Bolivia: A Data Science Repository to Study GeoSpatial Development in Bolivia [Data set]. GitHub. https://github.com/quarcs-lab/ds4bolivia

## Notebooks
- [Poverty Prediction (SDG 1)](predict_poverty_rf.ipynb)
- [Energy Poverty Prediction (SDG 7)](predict_energy_rf.ipynb)

---

*Analysis completed: 2026-01-15*
