# Population Data

## Overview

This directory contains annual population estimates for Bolivia's 339 municipalities from 2001 to 2020. Population data is essential for per capita calculations, demographic analysis, and as a control variable in development studies.

## Files

### pop.csv

Contains estimated total population for each municipality across 20 years (2001-2020).

## Data Sources

Population estimates are derived from:

- **National Census Data**: Bolivia's national censuses (2001, 2012)
- **Inter-censal Projections**: Statistical projections between census years
- **Administrative Records**: Municipal-level demographic updates
- **Satellite-based Estimates**: WorldPop, LandScan, or similar gridded population datasets

## Variable Dictionary

| Variable Name | Description |
| --- | --- |
| **asdf_id** | Unique spatial identifier for joining datasets |
| **pop2001** | Estimated total population in 2001 (persons) |
| **pop2002** | Estimated total population in 2002 (persons) |
| **pop2003** | Estimated total population in 2003 (persons) |
| **pop2004** | Estimated total population in 2004 (persons) |
| **pop2005** | Estimated total population in 2005 (persons) |
| **pop2006** | Estimated total population in 2006 (persons) |
| **pop2007** | Estimated total population in 2007 (persons) |
| **pop2008** | Estimated total population in 2008 (persons) |
| **pop2009** | Estimated total population in 2009 (persons) |
| **pop2010** | Estimated total population in 2010 (persons) |
| **pop2011** | Estimated total population in 2011 (persons) |
| **pop2012** | Estimated total population in 2012 (persons) |
| **pop2013** | Estimated total population in 2013 (persons) |
| **pop2014** | Estimated total population in 2014 (persons) |
| **pop2015** | Estimated total population in 2015 (persons) |
| **pop2016** | Estimated total population in 2016 (persons) |
| **pop2017** | Estimated total population in 2017 (persons) |
| **pop2018** | Estimated total population in 2018 (persons) |
| **pop2019** | Estimated total population in 2019 (persons) |
| **pop2020** | Estimated total population in 2020 (persons) |

## Usage

This dataset is used for:

- **Per Capita Calculations**: Normalize indicators by population size (e.g., NTL per capita, GDP per capita)
- **Demographic Analysis**: Track population growth, urbanization, and migration patterns
- **Density Calculations**: Compute population density when combined with area data
- **Control Variable**: Account for size effects in regression analysis
- **Weighting**: Create population-weighted averages and indices

## Example Code

You can run the examples below in [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/notebooks/empty.ipynb)

```python
import pandas as pd
import matplotlib.pyplot as plt

# Load population data
url = "https://raw.githubusercontent.com/quarcs-lab/ds4bolivia/master/pop/pop.csv"
df_pop = pd.read_csv(url)

# Calculate population growth rate (2001-2020)
df_pop['growth_rate'] = ((df_pop['pop2020'] / df_pop['pop2001']) ** (1/19) - 1) * 100

# Identify fastest growing municipalities
top_growth = df_pop.nlargest(10, 'growth_rate')

# Calculate total population change
df_pop['pop_change'] = df_pop['pop2020'] - df_pop['pop2001']
df_pop['pct_change'] = (df_pop['pop_change'] / df_pop['pop2001']) * 100

# Plot time series for all municipalities
years = range(2001, 2021)
pop_cols = [f'pop{year}' for year in years]

# Example: Plot aggregate national trend
total_pop = df_pop[pop_cols].sum()
plt.plot(years, total_pop)
plt.xlabel('Year')
plt.ylabel('Total Population')
plt.title('Bolivia Total Population (2001-2020)')
plt.show()
```

## Calculating Per Capita Indicators

You can run the examples below in [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/notebooks/empty.ipynb)

```python
# Load population and NTL data
df_pop = pd.read_csv("../pop/pop.csv")
df_ntl = pd.read_csv("../ntl/ln_NTLpc.csv")  # Already has per capita values

# Example: Calculate SDG per capita
df_sdg = pd.read_csv("../sdgVariables/sdgVariables.csv")

# Merge datasets
df_merged = df_pop.merge(df_sdg, on='asdf_id')

# Calculate investment per capita (example)
df_merged['investment_pc_2017'] = df_merged['sdg17_5_pipc']  # Already per capita in original
```

## Key Statistics

- **Time Period**: 2001-2020 (20 years)
- **Municipalities**: 339
- **Total Bolivia Population (2020)**: ~11.5 million
- **Average Municipal Population**: Varies widely from <1,000 to >900,000 (La Paz, Santa Cruz)

## Data Quality Notes

- **Census Years (2001, 2012)**: Higher confidence, direct enumeration
- **Inter-censal Years**: Estimates based on projections with varying uncertainty
- **Small Municipalities**: Greater relative error in estimates for low-population areas
- **Migration**: May not fully capture internal migration between municipalities

## Join Key

Use `asdf_id` to join this dataset with other datasets in the repository.

## Processing Scripts

See [code/040_clean_and_estimate_Population_trends.do](../code/README.md) for data processing details.

## References

- Instituto Nacional de Estadística (INE) Bolivia: [https://www.ine.gob.bo](https://www.ine.gob.bo)
- WorldPop Global Population Datasets: [https://www.worldpop.org](https://www.worldpop.org)
