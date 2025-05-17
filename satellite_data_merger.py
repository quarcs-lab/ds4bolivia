# %%

import pandas as pd 
from datetime import datetime

# %%
db = pd.read_csv("../project2021o/data/GeoDS4Bolivia_v20250512.csv") # 139 variables
db.drop(columns="Unnamed: 0", inplace=True)
desc = pd.read_csv("../project2021o/data/Definitions_GeoDS4Bolivia_v20250512.csv") 
# %%

# Air temperature
airTempMean_url = "https://raw.githubusercontent.com/HendrixPeralta/bol_hdi_prediction/refs/heads/main/data/satellite/collab_satellite_data/air_tem_mean_2012-17.csv"

airTempMean = pd.read_csv(airTempMean_url)
db = db.merge(airTempMean, left_on="asdf_id", right_on="id", right_index=False)
db.drop(columns="id", inplace=True)

# %%

airTempMin_url = "https://raw.githubusercontent.com/HendrixPeralta/bol_hdi_prediction/refs/heads/main/data/satellite/collab_satellite_data/air_temp_min_2012-2017.csv"

airTempMin = pd.read_csv(airTempMin_url)
db = db.merge(airTempMin, left_on="asdf_id", right_on="id")
db.drop(columns="id", inplace=True)

# %%
airTempMax_url = "https://raw.githubusercontent.com/HendrixPeralta/bol_hdi_prediction/refs/heads/main/data/satellite/collab_satellite_data/air_temp_max_2012-2017.csv"

airTempMax = pd.read_csv(airTempMax_url)
db = db.merge(airTempMax, left_on="asdf_id", right_on="id")
db.drop(columns="id", inplace=True)

# %%

# Exporting final version
today = datetime.now().strftime("%Y%m%d")
filename = f"GeoDS4Bolivia_v{today}.csv"
db.to_csv(f"../project2021o/data/{filename}")

# %%
