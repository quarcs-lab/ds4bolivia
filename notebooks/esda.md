---
jupytext:
  formats: ipynb,md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.19.1
kernelspec:
  display_name: Python 3
  name: python3
---

+++ {"id": "Kgo7hRPv77Xk"}

![](https://carlos-mendez.org/project/python_esda/featured_hud6e0c467148e45bb03790018c3cab111_119535_720x0_resize_q75_lanczos.jpg)

+++ {"id": "cuY-BTGn71uk"}

# Setup

```{code-cell}
---
id: vdg4h6On7PWp
colab:
  base_uri: https://localhost:8080/
outputId: d39947e7-1457-455e-82d2-6dd163388ab1
---
# Adding necessary libraries to Google Colab environment

# Installing the 'contextily' library for adding basemaps to plots
!pip install contextily -q

# Installing the 'splot' library for spatial data visualization
!pip install splot -q
```

```{code-cell}
:id: pQ_lhJmV7hxz

# Importing necessary libraries for data analysis and visualization
import numpy as np
import pandas as pd
pd.set_option('display.max_columns', None)
import matplotlib.pyplot as plt
import matplotlib.image as mpimg  # Importing matplotlib image for image plotting
import seaborn as sns

import plotly.express as px
import plotly.graph_objects as go

# Importing libraries for spatial data and visualization
import geopandas as gpd
import folium
from folium import Figure

import contextily as cx

import libpysal
from libpysal  import weights
from libpysal.weights import Queen

# Exploratory Spatial Data Analysis (ESDA) tools
import mapclassify as mc
import esda
from esda.moran import Moran, Moran_Local

# Spatial plotting tools
import splot
from splot.esda import moran_scatterplot, plot_moran, lisa_cluster, plot_local_autocorrelation
from splot.libpysal import plot_spatial_weights
from splot.mapping import vba_choropleth

# Statistical modeling
import statsmodels.api as sm
import statsmodels.formula.api as smf

# Suppressing warnings for cleaner output
import warnings
warnings.filterwarnings('ignore')
```

+++ {"id": "0TWKLHW58I3Y"}

# Import data

```{code-cell}
:id: bmoI2m747tcg

# Define the URL where the GeoJSON data is located
dataURL = 'https://github.com/quarcs-lab/project2021o-notebook/raw/main/map_and_data.geojson'

# Read the GeoJSON file from the specified URL using GeoPandas
# The resulting GeoDataFrame is assigned to the variable 'data'
data = gpd.read_file(dataURL)
data = data.to_crs(epsg=4326)
data["id"] = data.index.astype(str)
geojson_dict = data.__geo_interface__
```

```{code-cell}
---
colab:
  base_uri: https://localhost:8080/
  height: 320
id: Ok2iXyjd8N0u
outputId: 35238143-5cd4-45f9-d7da-a71d98984608
---
data.head(3)
```

```{code-cell}
---
colab:
  base_uri: https://localhost:8080/
  height: 424
id: gnRN1yTX8qJJ
outputId: 68cdb5a4-4c65-4c56-9463-7b336ed70941
---
dataDefinitions = pd.read_csv('https://raw.githubusercontent.com/quarcs-lab/project2021o-notebook/main/dataDefinitions.csv')
dataDefinitions
```

```{code-cell}
:id: 06j92q3L8qu-

data_dict = dict(zip(dataDefinitions['Variable'], dataDefinitions['Label']))
```

```{code-cell}
---
colab:
  base_uri: https://localhost:8080/
  height: 597
id: GMZnRvgeTS5J
outputId: 985f716b-e651-4cca-eb31-41dfa829726f
---
gdf = data[['id', 'mun', 'rank_imds', 'imds', 'geometry']]
gdf
```

+++ {"id": "dCztsu9vU8EH"}

# Plot map

```{code-cell}
---
colab:
  base_uri: https://localhost:8080/
  height: 637
id: 6PqZn_hGsu-I
outputId: 30f414e5-a418-4174-ef5d-08392cb766ce
---
  # Plot with proper geojson and explicit color scale "viridis"
  fig = px.choropleth_mapbox(
      data_frame=gdf,
      geojson=geojson_dict,
      locations="id",
      color="imds",
      hover_name = 'mun',
      hover_data=['imds', 'rank_imds'],
      color_continuous_scale="RdBu_r",
      mapbox_style="carto-positron",
      zoom=4.5,
      center={"lat": data.geometry.centroid.y.mean(), "lon": data.geometry.centroid.x.mean()},
      opacity=0.6
  )

  # Set figure dimensions to 600x600 pixels (6 in x 6 in at 100 DPI)
  fig.update_layout(margin={"r": 0, "t": 0, "l": 0, "b": 0}, width=630, height=600)
  fig.show()
```

```{code-cell}
:id: qhAZQafO9hnT

fig.write_html("mapBolivia339imds.html", include_plotlyjs='cdn')
```

```{code-cell}
---
id: zEkFCRIXKfsu
colab:
  base_uri: https://localhost:8080/
  height: 394
outputId: c1b599fd-6751-42a1-e85b-21e2c00ceeb0
---
# Visualize spatial data using the explore() method of a GeoDataFrame
gdf.explore(
    # Specify the column to visualize on the map
    column='imds',
    # Specify the attributes to display in the tooltip when hovering over map features
    tooltip=['mun', 'imds', 'rank_imds'],
    # Choose the classification scheme for data visualization
    scheme='fisherjenks',
    # Specify the number of classes for classification
    k=3,
    # Choose the colormap for data visualization
    cmap='coolwarm',
    # Specify whether to display a legend
    legend=True,
    # Choose the basemap tiles provider
    tiles='CartoDB positron',
    # Customize the style of the basemap tiles
    style_kwds=dict(color="gray", weight=0.5),
    # Customize the appearance of the legend
    legend_kwds=dict(colorbar=False)
)
```

+++ {"id": "F0s4u89iVBP_"}

# Spatial weights and lags

```{code-cell}
:id: xgpN0wUsVFM9

# Create K-nearest neighbors (KNN) spatial weights from the GeoDataFrame gdf
# k=6 specifies the number of nearest neighbors to consider for each observation
W = weights.KNN.from_dataframe(gdf, k=6)

# Transform the spatial weights to row-standardized form
W.transform = 'r'
```

```{code-cell}
:id: ZfTGXtnO7hwD

# Reproject to use contextily
gdf = gdf.to_crs(epsg=3857)
```

```{code-cell}
---
colab:
  base_uri: https://localhost:8080/
  height: 728
id: hHCTIgDk6YWY
outputId: c51db1c9-6d24-4d8b-8043-2fb228e6b656
---
# Plot the spatial weights using splot library
# This will visualize the spatial relationships between observations defined by the weights matrix W
fig, ax = plt.subplots(ncols=1, nrows=1, figsize=(14,10))
plot_spatial_weights(W, gdf, ax=ax)
cx.add_basemap(ax, crs=gdf.crs.to_string(), source = cx.providers.CartoDB.Positron,           attribution=False)
cx.add_basemap(ax, crs=gdf.crs.to_string(), source = cx.providers.CartoDB.PositronOnlyLabels, attribution=False)
plt.show()
```

```{code-cell}
:id: LZ4QV-dFcM0R

# Calculate spatial lag of INDICATOR1 using the specified weights
gdf['Wimds'] = weights.lag_spatial(W, gdf['imds'])
```

```{code-cell}
:id: YobX7Sp5fNCz

data_dict.update({'Wimds': 'Development index in neighboring municipalities'})
```

```{code-cell}
---
id: byQ_8Yr2dsFJ
colab:
  base_uri: https://localhost:8080/
  height: 424
outputId: ce889634-a5b3-4186-f7db-ea80ebddd647
---
gdf[['mun', 'imds', 'Wimds']]
```

+++ {"id": "4U9O4ZE0eE-V"}

# Global spatial dependence

```{code-cell}
---
id: E_9dy96Kd9bm
colab:
  base_uri: https://localhost:8080/
  height: 542
outputId: 2a4e7db1-6e9f-47d6-de57-ccf153aa57a7
---
# Create a scatter plot using Plotly Express
px.scatter(
    gdf,
    x='imds',                               # Data for the x-axis
    y='Wimds',                              # Data for the y-axis
    hover_name='mun',                       # Display municipality name in hover tooltip
    hover_data=['mun', 'imds', 'Wimds'],    # Additional data to display in hover tooltip
    trendline="ols",                        # Add an ordinary least squares (OLS) trendline
    marginal_x="box",                       # Display marginal box plot on the x-axis
    marginal_y="box",                       # Display marginal box plot on the y-axis
    labels=dict(data_dict)                  # Customize axis labels using data_dict
)
```

```{code-cell}
---
id: zaxhVHSdgdAn
colab:
  base_uri: https://localhost:8080/
  height: 35
outputId: 3b3dcfad-d275-476e-d3fe-d1e727d75ab8
---
# Compute Global Moran's I statistic for the 'imds' variable using the spatial weights matrix W
globalMoran = Moran(gdf['imds'], W)

# Format Moran's I statistic to two decimal places
moranI = "{:.2f}".format(globalMoran.I)

# Print Moran's I statistic
moranI
```

```{code-cell}
---
id: iH8bkJPfgid4
colab:
  base_uri: https://localhost:8080/
outputId: 6b035c22-b9d7-40f0-e556-f8b509432c67
---
print(globalMoran.p_sim)
```

+++ {"id": "wJwarq5qgLvJ"}

# Local spatial dependence

```{code-cell}
:id: tytMegIbqujy

# Read GeoJSON file from GitHub using GeoPandas
# gdf2 is assigned the GeoDataFrame containing the data from the provided URL
gdf2 = gpd.read_file('https://github.com/wmgeolab/geoBoundaries/raw/905b0ba/releaseData/gbOpen/BOL/ADM1/geoBoundaries-BOL-ADM1_simplified.geojson')

# Reproject gdf2 to match the coordinate reference system (CRS) of gdf
gdf2 = gdf2.to_crs(gdf.crs)

# Calculate representative points for each geometry in gdf2
# 'coords' column is added to gdf2, containing the coordinates of the representative points
gdf2['coords'] = gdf2['geometry'].apply(lambda x: x.representative_point().coords[:])

# Extract the coordinates from the representative points and assign them to the 'coords' column
gdf2['coords'] = [coords[0] for coords in gdf2['coords']]
```

```{code-cell}
:id: pwlIWOE8gLWT

# Calculate Local Moran's I statistics
# gdf['imds'] is the variable for which local spatial autocorrelation is computed
# W is the spatial weights matrix defining the spatial relationships between observations
# permutations specifies the number of random permutations for statistical inference
# seed sets the seed for reproducibility of random permutations
moranLocal = Moran_Local(gdf['imds'], W, permutations=999, seed=12345)
```

```{code-cell}
---
colab:
  base_uri: https://localhost:8080/
  height: 506
id: OIUUOXVR0ljE
outputId: 4aa544bb-2870-4b58-cc08-50b77efe6934
---
# Adjust the aspect ratio for better readability
# Create a subplot with one plot
f, ax = plt.subplots(1, figsize=(7, 5))

# Plot Local Indicators of Spatial Association (LISA) clusters
# moranLocal is a Moran_Local object containing local Moran statistics
# gdf is a GeoDataFrame containing spatial data
# p is the significance level for identifying clusters
# legend_kwds is a dictionary containing keyword arguments for the legend
lisa_cluster(moranLocal, gdf, p=0.05, legend_kwds={'bbox_to_anchor':(0.02, 0.90)}, ax=ax)

# Plot the GeoDataFrame gdf2 with only the border (no filled polygons)
gdf2.plot(facecolor='none', edgecolor='black', ax=ax)

# Annotate the plot with text labels for each geometry in gdf2
# Text labels are placed at the coordinates of each geometry
texts =[ax.text(row.coords[0], row.coords[1], s=row['shapeName'], horizontalalignment='center', bbox={'facecolor': 'white', 'alpha':0.8, 'pad': 2, 'edgecolor':'none'}) for idx, row in gdf2.iterrows()]

# Add a basemap to the plot using the contextily package
# crs is the coordinate reference system of gdf
# source specifies the basemap provider (CartoDB.Voyager/CartoDB.Positron)
# attribution=False removes the attribution from the basemap
cx.add_basemap(ax, crs=gdf.crs.to_string(), source=cx.providers.CartoDB.Positron, attribution=False)

# Add a title to the plot for context
ax.set_title("(b) Spatial clusters and outliers (p<0.05)")

# Adjust layout to prevent clipping of titles and labels
plt.tight_layout()

# Save the plot as an image file with high DPI and tight bounding box
plt.savefig("lisaMAP.png", dpi=300, bbox_inches='tight')

# Display the plot
plt.show()
```

```{code-cell}
:id: __tGfLtZhhwj

# Add local Moran's I p-values to the GeoDataFrame
gdf['lisa'] = moranLocal.p_sim

# Classify and assign cluster types based on significance levels
# If p-value is less than 0.05, assign cluster type based on quadrant (q)
gdf.loc[moranLocal.p_sim < 0.05, 'cluster'] = moranLocal.q[moranLocal.p_sim < 0.05]

# Fill NaN values with 0 (for non-significant observations)
gdf["cluster"] = gdf["cluster"].fillna(0)

# Map cluster codes to descriptive labels
gdf["cluster"] = gdf["cluster"].map({
    0: "Not significant",   # No significant spatial autocorrelation
    1: "High-high",         # High value surrounded by high values (hotspot)
    2: "Low-high",          # Low value surrounded by high values
    3: "Low-low",           # Low value surrounded by low values (coldspot)
    4: "High-low",          # High value surrounded by low values
})
```

```{code-cell}
---
id: oNIvFLLWiG36
colab:
  base_uri: https://localhost:8080/
  height: 964
outputId: e2432f5f-6fc2-4bf3-9eeb-44401a167de6
---
gdf = gdf.sort_values(by='cluster')
gdf
```

```{code-cell}
---
id: pO9ZvNJxluAz
colab:
  base_uri: https://localhost:8080/
outputId: b8a2fdc6-b5e5-4e8c-c461-5883d7062708
---
gdf['cluster'].unique()
```

```{code-cell}
---
colab:
  base_uri: https://localhost:8080/
  height: 394
id: cOPAvget2ZHp
outputId: 3c6365ce-f5f8-46bb-ac25-3d605546433f
---
# Visualize spatial data using the explore() method of a GeoDataFrame
gdf.explore(
    column='cluster',                              # Specify the column for visualization
    tooltip=['mun', 'rank_imds', 'cluster', 'lisa', 'imds', 'Wimds'],  # Specify attributes for tooltip
    cmap=["#c23429", "#efb16e",  "#b5d8e7",  "#4679b1",  "#d3d3d3"],  # Define color map for clusters #c23429 (Red) #4679b1 (Blue), #b5d8e7 (Light blue), #efb16e(Orange), #d3d3d3 (Light grey)
    legend=True,                                   # Display legend
    tiles='CartoDB positron',                      # Choose basemap tiles provider
    style_kwds=dict(color="gray", weight=0.5),     # Customize the color and lines of boundaries
    legend_kwds=dict(colorbar=False)               # Customize legend appearance
)
```

```{code-cell}
---
id: BY9Kth5Iou1z
colab:
  base_uri: https://localhost:8080/
  height: 542
outputId: 4cc4db3d-c27c-48bc-d0de-70f4eed541c2
---
# Create a scatter plot using Plotly Express
fig = px.scatter(
    gdf,
    x='imds',                               # Data for the x-axis
    y='Wimds',                              # Data for the y-axis
    color='cluster',                        # Color points by cluster type
    color_discrete_sequence=["#c23429", "#efb16e", "#b5d8e7", "#4679b1", "#d3d3d3"],  # Define color sequence for clusters
    hover_name='mun',                       # Display municipality name in hover tooltip
    hover_data=['mun', 'cluster', 'imds', 'Wimds', 'lisa'],  # Additional data for hover tooltip
    trendline="ols",                        # Add an ordinary least squares (OLS) trendline
    trendline_scope='overall',              # Fit a single trendline for all data points
    labels=dict(data_dict)                  # Customize axis labels using data_dict
)

# Set the color of the trendline to black
fig.update_traces(line=dict(color='black'))

# Set the range for x-axis and y-axis
x_range = [min(gdf['imds']), max(gdf['imds'])]
y_range = [min(gdf['Wimds']), max(gdf['Wimds'])]
fig.update_xaxes(range=x_range)
fig.update_yaxes(range=y_range)

# Add horizontal and vertical lines at the average values
average_imds_value = gdf['imds'].mean()
average_wimds_value = gdf['Wimds'].mean()

fig.add_shape(
    type="line",
    x0=average_imds_value,
    y0=y_range[0],
    x1=average_imds_value,
    y1=y_range[1],
    line=dict(color="grey", width=1, dash="dash")
)

fig.add_shape(
    type="line",
    x0=x_range[0],
    y0=average_wimds_value,
    x1=x_range[1],
    y1=average_wimds_value,
    line=dict(color="grey", width=1, dash="dash")
)

# Update layout to set plot background color to white
fig.update_layout(plot_bgcolor='#f9f9f7')

# Display the updated figure
fig.show()
```

```{code-cell}
---
colab:
  base_uri: https://localhost:8080/
  height: 463
id: 45LwSebN46b2
outputId: 1c8ede9d-205f-4e75-fda7-e336eee24174
---
# Set Seaborn theme to white grid for cleaner appearance
sns.set_style('whitegrid')

# Adjust the aspect ratio for better readability
f, ax = plt.subplots(1, figsize=(7, 5))

# Add the regression line with all grey points
sns.regplot(
    x='imds',
    y='Wimds',
    data=gdf,
    scatter=True,
    marker='.',
    color='#d3d3d3',                    # Light gray for points
    line_kws={'linewidth': 2, 'color': 'black'}  # Black for regression line
)

# Overlay the significant points
sns.scatterplot(
    x='imds',
    y="Wimds",
    hue="cluster",
    palette= ["#c23429", "#efb16e",  "#b5d8e7",  "#4679b1",  "#d3d3d3"],  # #c23429 (Red) #4679b1 (Blue), #b5d8e7 (Light blue), #efb16e(Orange), #d3d3d3 (Light grey)
    data=gdf,
    marker=".",
    s=200,  # Increase the marker size here
    alpha=0.99,  # No need for scatter_kws here
    legend=False  # Add this line to remove the legend
)

# Remove spines for a cleaner look
sns.despine(top=True, bottom=True, left=True, right=True)

# Add reference lines (average values)
plt.axvline(gdf['imds'].mean(), c='black', alpha=0.5, linestyle='--')
plt.axhline(gdf['Wimds'].mean(), c='black', alpha=0.5, linestyle='--')

# Annotate quadrants directly for clarity
ax.annotate('(HH) High-high', xy=(70, 65), xytext=(70, 65), fontsize=10,
            bbox=dict(boxstyle='round,pad=0.5', fc='white', ec='black', lw=1))
ax.annotate('(HL) High-low', xy=(70, 40), xytext=(70, 40), fontsize=10,
            bbox=dict(boxstyle='round,pad=0.5', fc='white', ec='black', lw=1))
ax.annotate('(LH) Low-high', xy=(35, 65), xytext=(35, 65), fontsize=10,
            bbox=dict(boxstyle='round,pad=0.5', fc='white', ec='black', lw=1))
ax.annotate('(LL) Low-low', xy=(35, 40), xytext=(35, 40), fontsize=10,
            bbox=dict(boxstyle='round,pad=0.5', fc='white', ec='black', lw=1))

# Add a title for context
ax.set_title(f"(a) Moran scatterplot (Moran's I = {moranI})")

# Create more informative labels
ax.set_xlabel('Development index')                 # Replace with the actual variable name
ax.set_ylabel('Development index in neighboring locations')   # Replace if applicable

# Set background color for the plot
ax.set_facecolor('#f9f9f7')

# Save and show the plot
plt.tight_layout()
plt.savefig('lisaSC.png', dpi=300, bbox_inches='tight')
plt.show()
```

+++ {"id": "B16SUhL_sXW5"}

# Combined figures

```{code-cell}
---
colab:
  base_uri: https://localhost:8080/
  height: 282
id: o_cDaZuT5uga
outputId: dc82ea28-2d61-4b9c-ee21-e6c70fc9dcc7
---
# Combine figures

# Read the two PNG files
image1 = mpimg.imread('lisaSC.png')
image2 = mpimg.imread('lisaMAP.png')

# Create a figure and a 1x2 grid of subplots
fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(14, 5))

# Display the first image in the first subplot
ax1.imshow(image1)
ax1.axis('off')  # Turn off axis for cleaner appearance

# Display the second image in the second subplot
ax2.imshow(image2)
ax2.axis('off')  # Turn off axis for cleaner appearance

# Adjust the horizontal spacing between subplots
plt.subplots_adjust(wspace=-0.4)

# Save and show the combined figure
plt.tight_layout()  # Ensure tight layout
plt.savefig('lisa.png', dpi=300, bbox_inches='tight')  # Save the figure as PNG
plt.show()  # Display the combined figure
```
