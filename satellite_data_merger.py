# %%

import pandas as pd 
from datetime import datetime

# %%
db = pd.read_csv("../project2021o/data/GeoDS4Bolivia_v20250512.csv") # 139 variables
desc = pd.read_csv("../project2021o/data/Definitions_GeoDS4Bolivia_v20250512.csv") 
# %%
airTempMean_url = "https://raw.githubusercontent.com/HendrixPeralta/bol_hdi_prediction/refs/heads/main/data/satellite/collab_satellite_data/air_tem_mean_2012-17.csv"

airTempMean = pd.read_csv(airTempMean_url)
db = db.merge(airTempMean, left_on="asdf_id", right_on="id")

# %%

# Exporting final version
today = datetime.now().strftime("%Y%m%d")
filename = f"GeoDS4Bolivia_v{today}.csv"
db.to_csv(f"../project2021o/data/{filename}")
# %%
