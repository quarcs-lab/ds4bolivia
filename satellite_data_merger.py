# %%

import pandas as pd 
from datetime import datetime

# %%
db = pd.read_csv("../project2021o/data/GeoDS4Bolivia_v20250512.csv") # 139 variables
db.drop(columns="Unnamed: 0", inplace=True)
desc = pd.read_csv("../project2021o/data/Definitions_GeoDS4Bolivia_v20250512.csv") 
# %%

# Air temperature =============================================================

#Adding new values to the dataset
airTempMean_url = "https://raw.githubusercontent.com/HendrixPeralta/bol_hdi_prediction/refs/heads/main/data/satellite/collab_satellite_data/air_tem_mean_2012-17.csv"

airTempMean = pd.read_csv(airTempMean_url)
db = db.merge(airTempMean, left_on="asdf_id", right_on="id", right_index=False)
db.drop(columns="id", inplace=True)
# %%
vName = airTempMean.columns[~airTempMean.columns.str.contains("id")].to_list()

# Creating variable names and labels
vLabel = []
years = range(2012,2018)
for year in years:
    vLabel.append(f"Mean Air Temperature in Celcius in {year}")

rows = pd.DataFrame({"varname":vName, "varlabel":vLabel})
desc = pd.concat([desc, rows], ignore_index=True)
# %%

airTempMin_url = "https://raw.githubusercontent.com/HendrixPeralta/bol_hdi_prediction/refs/heads/main/data/satellite/collab_satellite_data/air_temp_min_2012-2017.csv"

airTempMin = pd.read_csv(airTempMin_url)
db = db.merge(airTempMin, left_on="asdf_id", right_on="id")
db.drop(columns="id", inplace=True)


# %%

vName = airTempMin.columns[~airTempMin.columns.str.contains("id")].tolist()

vLabel = []
for year in years:
    vLabel.append(f"Minimum Air Temperature in Celcius in {year}")
    
rows = pd.DataFrame({"varname":vName, "varlabel":vLabel})
desc = pd.concat([desc,rows], ignore_index=True)

# %%
airTempMax_url = "https://raw.githubusercontent.com/HendrixPeralta/bol_hdi_prediction/refs/heads/main/data/satellite/collab_satellite_data/air_temp_max_2012-2017.csv"

airTempMax = pd.read_csv(airTempMax_url)
db = db.merge(airTempMax, left_on="asdf_id", right_on="id")
db.drop(columns="id", inplace=True)


# %%

vName = airTempMax.columns[~airTempMax.columns.str.contains("id")].tolist()

vLabel = []
for year in years:
    vLabel.append(f"Maximum Air Temperature in Celcius in {year}")
    
rows = pd.DataFrame({"varname":vName, "varlabel":vLabel})
desc = pd.concat([desc,rows], ignore_index=True)


# ============================================================= Air temperature
# %%

# def nameLabelCreation(desc_db, db, label="no Label", range=False, year=0, ):
#     vName = db.colums[~db.columns.str.contains("id")].to_list()
    
#     if range != False:
#         vLabel = []
#         for year in range:
#             vLabel.append(f"{label} in {year}")
    
#     elif year != 0: 
#         vLabel = f"{label} in {year}" 
    
#     else: 
#         print("missing arguments")
        
#     rows = pd.DataFrame({"varname":vName, "varlabel":vLabel})  
#     return rows
    

# %%

 # Coast Distance ===============================================================
coastDistance_url = "https://raw.githubusercontent.com/HendrixPeralta/bol_hdi_prediction/refs/heads/main/data/satellite/collab_satellite_data/coast_distance_2017.csv"

coastDistance = pd.read_csv(coastDistance_url)

db = db.merge(coastDistance, left_on="asdf_id", right_on="id")
db.drop(columns="id", inplace=True)

# %%

vName = coastDistance.columns[~coastDistance.columns.str.contains("id")].to_list()

vLabel =["Mean distance to coast in meters in 2017",
         "Max distance to coast in meters in 2017",
         "Min distance to coast in meters in 2017"]

rows = pd.DataFrame({"varname":vName, "varlabel":vLabel})
desc = pd.concat([desc,rows], ignore_index=True)



# =============================================================== Coast Distance
# %%
# Export ===============================================================
# Exporting final version
today = datetime.now().strftime("%Y%m%d")

db_filename = f"GeoDS4Bolivia_v{today}.csv"
db.to_csv(f"../project2021o/data/{db_filename}")

desc_filename = f"Definitions_GeoDS4Bolivia_v{today}.csv"
desc.to_csv(f"../project2021o/data/{desc_filename}")

 # ============================================================== Exoport
# %%
