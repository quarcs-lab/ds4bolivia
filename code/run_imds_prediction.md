# Predicting Municipal Sustainable Development Index (IMDS) Using Satellite Embeddings

## Overview

This analysis predicts the **IMDS (Índice Municipal de Desarrollo Sostenible)** - a composite index that aggregates all Sustainable Development Goal (SDG) indicators into a single municipal development score - using 64-dimensional satellite imagery embeddings from Google Earth Engine.

The IMDS provides a comprehensive measure of sustainable development at the municipal level, making it a valuable target for understanding how satellite-derived features can capture overall development patterns.

## Data Description

| Dataset | Source | Observations |
| --- | --- | --- |
| SDG Data (IMDS) | sdg/sdg.csv | 339 municipalities |
| Satellite Embeddings | satelliteEmbeddings/satelliteEmbeddings2017.csv | 339 municipalities (64 features) |
| Region Names | regionNames/regionNames.csv | 339 municipalities |

### Target Variable: IMDS

- **Range**: 35.70 to 80.20
- **Mean**: 51.05 ± 6.76
- **Description**: The IMDS is a normalized composite index (0-100 scale) combining all SDG indicators into a single measure of municipal sustainable development

## Methodology

### Model Configuration

| Parameter | Value | Rationale |
| --- | --- | --- |
| Algorithm | Random Forest Regressor | Handles high-dimensional data, captures non-linear relationships |
| n_estimators | 100 | Memory-efficient while maintaining accuracy |
| max_depth | 20 | Prevents overfitting while allowing complex patterns |
| min_samples_split | 5 | Standard regularization |
| min_samples_leaf | 2 | Ensures leaf nodes have sufficient samples |
| max_features | sqrt | ~8 features per split for decorrelated trees |

### Data Split

- **Training set**: 271 municipalities (80%)
- **Test set**: 68 municipalities (20%)
- **Cross-validation**: 5-fold on training set

## Results

### Model Performance

| Metric | Training Set | Test Set |
| --- | --- | --- |
| R² Score | 0.8160 | 0.2284 |
| RMSE | 2.82 | 6.53 |
| MAE | 2.02 | 4.75 |

### Cross-Validation Results

| Fold | R² Score |
| --- | --- |
| 1 | 0.2058 |
| 2 | 0.2022 |
| 3 | 0.2511 |
| 4 | 0.2097 |
| 5 | 0.2754 |
| **Mean** | **0.2288 (±0.0292)** |

## Feature Importance Analysis

### Top 10 Most Important Features

| Rank | Feature | Importance | Cumulative % |
| --- | --- | --- | --- |
| 1 | A30 | 0.0619 | 6.19% |
| 2 | A59 | 0.0380 | 9.99% |
| 3 | A57 | 0.0304 | 13.02% |
| 4 | A13 | 0.0276 | 15.79% |
| 5 | A26 | 0.0249 | 18.28% |
| 6 | A20 | 0.0245 | 20.73% |
| 7 | A21 | 0.0239 | 23.12% |
| 8 | A58 | 0.0219 | 25.31% |
| 9 | A33 | 0.0216 | 27.46% |
| 10 | A00 | 0.0215 | 29.61% |

### Key Insight
- **44 out of 64 features (68.8%)** are needed to capture 80% of the model's predictive power
- This indicates that overall sustainable development is captured by a broad range of satellite-derived features, unlike more specific indicators (e.g., extreme energy poverty) which concentrate importance in fewer features

## Prediction Error Analysis

### Most Overpredicted Municipalities
(Model predicts higher development than actual)

| Municipality | Department | Actual IMDS | Predicted IMDS | Error |
| --- | --- | --- | --- | --- |
| Tinguipaya | Potosí | 36.40 | 48.19 | -11.79 |
| Poroma | Chuquisaca | 35.70 | 46.58 | -10.88 |
| Ayata | La Paz | 43.60 | 52.81 | -9.21 |
| El Choro | Oruro | 42.90 | 51.57 | -8.67 |
| Cruz de Machacamarca | Oruro | 45.20 | 51.71 | -6.51 |

**Pattern**: These are predominantly rural highland municipalities where satellite features may capture physical infrastructure or land patterns that don't translate to actual development outcomes due to harsh climate, isolation, or other factors not visible from space.

### Most Underpredicted Municipalities
(Model predicts lower development than actual)

| Municipality | Department | Actual IMDS | Predicted IMDS | Error |
| --- | --- | --- | --- | --- |
| La Paz | La Paz | 80.20 | 51.26 | +28.94 |
| Vinto | Cochabamba | 64.00 | 51.31 | +12.69 |
| Trinidad | Beni | 61.30 | 49.07 | +12.23 |
| Huachacalla | Oruro | 61.30 | 49.44 | +11.86 |
| Llallagua | Potosí | 58.10 | 46.64 | +11.46 |

**Pattern**: Urban centers and capital cities are systematically underpredicted. The model struggles to capture the full extent of development in dense urban areas, particularly La Paz with a 29-point error. This suggests that satellite embeddings may not fully capture institutional, economic, and service-related aspects of development that are concentrated in urban centers.

## Interpretation

### Why is the R² relatively low (22.84%)?

The IMDS is a **composite index** aggregating diverse indicators across all SDGs, including:
- Institutional factors (governance, justice)
- Service delivery (health, education)
- Economic indicators (employment, banking)
- Environmental measures (emissions, protected areas)
- Social indicators (gender equality, inequality)

Many of these dimensions are **not directly observable from satellite imagery**. For example:
- Quality of education or health services
- Governance effectiveness
- Gender equality measures
- Financial inclusion
- Institutional capacity

### Comparison with Other Predictions

| Target Variable | Test R² | CV R² | Interpretation |
| --- | --- | --- | --- |
| IMDS (overall development) | 0.23 | 0.23 | Lowest - most abstract measure |
| SDG 1 Index (poverty) | 0.40 | 0.36 | Moderate - poverty has spatial signatures |
| SDG 7 Index (energy) | 0.35 | 0.25 | Moderate - energy relates to lights/infrastructure |
| Extreme Energy Poverty Rate | 0.22 | 0.57 | Variable - specific measurement challenge |

The IMDS prediction performance is consistent with expectations: satellite imagery can capture some physical manifestations of development (infrastructure, land use, urban expansion) but cannot observe many institutional, social, and economic dimensions that comprise the full development index.

### Urban-Rural Divide

The prediction errors reveal a systematic **urban-rural divide**:
- **Urban centers underpredicted**: Cities achieve higher development than their physical appearance suggests (institutional services, economic opportunities)
- **Rural highlands overpredicted**: Some rural areas with visible infrastructure still face development challenges not captured in satellite imagery (isolation, climate, service access)

## Policy Implications

1. **Satellite data as complementary tool**: While satellite embeddings provide useful information about development, they should be combined with traditional survey data for comprehensive assessment

2. **Targeting efficiency**: The 23% explained variance suggests satellite data can help prioritize areas for detailed surveys, particularly for physical infrastructure components

3. **Urban monitoring limitations**: For urban centers, satellite embeddings underestimate actual development, requiring additional data sources for accurate assessment

4. **Highland development**: Rural highland municipalities show systematic prediction errors, suggesting unique development challenges that require localized interventions

## Files Generated

| File | Description |
| --- | --- |
| `imds_prediction_results.png` | Comprehensive visualization with 6 panels |
| `imds_test_predictions.csv` | Detailed predictions for all test municipalities |
| `imds_feature_importance.csv` | Feature importance rankings for all 64 embeddings |
| `imds_model_summary.csv` | Model configuration and performance summary |

## Visualization

![IMDS Prediction Results](imds_prediction_results.png)

The visualization includes:
1. **Actual vs Predicted scatter plot** with 1:1 reference line
2. **Residual plot** showing prediction errors across the prediction range
3. **Error distribution histogram** showing error frequency
4. **Feature importance bar chart** for top 20 features
5. **Cumulative importance curve** showing feature concentration
6. **Cross-validation scores** across 5 folds

## Conclusion

Satellite embeddings explain approximately **23% of the variance in municipal sustainable development (IMDS)** in Bolivia. This moderate predictive power reflects the composite nature of the IMDS, which includes many dimensions (institutional, social, economic) that are not directly observable from satellite imagery.

The analysis reveals systematic patterns:
- **Urban centers are underpredicted** - cities achieve higher development than satellite features suggest
- **Rural highlands are overpredicted** - visible infrastructure doesn't always translate to development outcomes
- **Feature importance is distributed** - unlike specific indicators, overall development requires many satellite features

These findings suggest that satellite-based predictions are most useful for:
- Identifying broad spatial patterns in development
- Prioritizing areas for detailed surveys
- Monitoring physical infrastructure changes over time
- Complementing (not replacing) traditional development indicators

---

## Technical Details

**Script**: `run_imds_prediction.py`

**Dependencies**:
- pandas
- numpy
- matplotlib
- seaborn
- scikit-learn

**Execution Time**: ~30 seconds (memory-efficient configuration)

**Random State**: 42 (for reproducibility)
