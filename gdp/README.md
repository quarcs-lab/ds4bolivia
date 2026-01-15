# GDP Data

## Overview

This directory is designated for Gross Domestic Product (GDP) data at the municipal level for Bolivia.

## Current Status

This directory is currently empty. GDP-related information can be found in:

- **[Interactive Dashboard](https://carlos-mendez.projects.earthengine.app/view/geoexplorer1v100bolivia)** - Visualizes GDP estimates along with other indicators
- **Archive data**: [archive20250523/](../archive20250523/) - May contain historical GDP datasets

## Planned Content

Future GDP datasets may include:

- Municipal GDP estimates (total and per capita)
- Sectoral GDP breakdowns (agriculture, industry, services)
- Time series of economic output (multiple years)
- GDP growth rates and trends

## Related Economic Indicators

While this directory is empty, the repository contains related economic proxies:

- **[Night-time Lights (NTL)](../ntl/)** - Proxy for economic activity and electrification
- **[SDG 8 Index](../sdg/)** - Decent Work and Economic Growth indicators
- **[Population](../pop/)** - Denominator for per capita calculations

## Variable Structure (When Available)

Future GDP datasets will likely include:

| Variable Name | Description |
| --- | --- |
| **asdf_id** | Unique spatial identifier for joining datasets |
| **gdp_total** | Total GDP at municipal level (in Bolivianos or USD) |
| **gdp_per_capita** | GDP divided by population |
| **year** | Reference year for the estimate |

## Methodology

GDP estimates at the municipal level are typically derived from:

- **Satellite-based proxies**: Night-time lights, building density, land use
- **Machine learning models**: Using satellite embeddings to predict economic output
- **Statistical downscaling**: Disaggregating department-level GDP to municipalities
- **Survey-based estimates**: Household income and expenditure surveys

## Join Key

Use `asdf_id` to join GDP data with other datasets in this repository.

## References

For GDP estimation methodologies using satellite data, see:

- [Henderson, J. V., Storeygard, A., & Weil, D. N. (2012). Measuring economic growth from outer space](https://www.aeaweb.org/articles?id=10.1257/aer.102.2.994)
- Main project README: [Data Integration Examples](../README.md)
