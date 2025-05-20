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
# Diamond Distance ===============================================================
diaDistance_url = "https://raw.githubusercontent.com/HendrixPeralta/bol_hdi_prediction/refs/heads/main/data/satellite/collab_satellite_data/diamond_distance_2017.csv"

diaDistance = pd.read_csv(diaDistance_url)

db = db.merge(diaDistance, left_on="asdf_id", right_on="id")
db.drop(columns="id", inplace=True)

# %% 

vName = diaDistance.columns[~diaDistance.columns.str.contains("id")].tolist()
vLabel =["Min distance to diamond deposits in meters in 2017",
         "Mean distance to diamond deposits in meters in 2017",
         "Max distance to diamond deposits in meters in 2017"
         ]

rows = pd.DataFrame({"varname":vName, "varlabel":vLabel})
desc = pd.concat([desc,rows], ignore_index=True)

# =============================================================== Diamond Distance

# %%
# Drug cultivation  ===============================================================

drugCult_url = "https://raw.githubusercontent.com/HendrixPeralta/bol_hdi_prediction/refs/heads/main/data/satellite/collab_satellite_data/drug_cultivation_2017.csv"
drugCult = pd.read_csv(drugCult_url)
drugCult.drop(columns=['drugCult_cannabis2017',
                       'drugCult_opium2017',
                       'drugCult_mix2017'],
              inplace=True)
db = db.merge(drugCult, left_on="asdf_id", right_on="id")
db.drop(columns="id", inplace=True)

# %%
vName = drugCult.columns[~drugCult.columns.str.contains("id")].to_list()
vLabel = ["Total area in polygons in 2017",
         "Area without drug cultivation in polygons in 2017",
         "Area with coca bush cultivation in polygons in 2017"]

rows = pd.DataFrame({"varname":vName, "varlabel":vLabel})
desc = pd.concat([desc,rows], ignore_index=True)
# =============================================================== Drug Cultivation

# %%
# Drug Cult Distance ===============================================================
drugDistance_url = "https://raw.githubusercontent.com/HendrixPeralta/bol_hdi_prediction/refs/heads/main/data/satellite/collab_satellite_data/drug_cultivation_distance_2017.csv"
drugDistance = pd.read_csv(drugDistance_url)

db = db.merge(drugDistance, left_on="asdf_id", right_on="id")
db.drop(columns="id", inplace=True)
# %%
vName = drugDistance.columns[~drugDistance.columns.str.contains("id")].tolist()
vLabel = ["Mean distance to drug cultivation sites in meters in 2017",
         "Max distance to drug cultivation sites in meters in 2017",
         "Min distance to drug cultivation sites in meters in 2017"]

rows = pd.DataFrame({"varname":vName, "varlabel":vLabel})
desc = pd.concat([desc,rows], ignore_index=True)

# =============================================================== Drug Cult Distance

# %%

# esa_landcover ===============================================================
esa_landcover_url = "https://raw.githubusercontent.com/HendrixPeralta/bol_hdi_prediction/refs/heads/main/data/satellite/collab_satellite_data/esa_landcover_2012-2016.csv"

esa_landcover = pd.read_csv(esa_landcover_url)

db = db.merge(esa_landcover, left_on="asdf_id", right_on="id")
db.drop(columns="id", inplace=True)

# %%

vName = esa_landcover.columns[~esa_landcover.columns.str.contains("id")].to_list()

vLabel = []
for col in vName: 
    year = col.split("esaLandCover",1)[1].split("_")[0]
    category = col.split("_",1)[1].replace("_", " ")
    
    label = f"{category} ESA land cover classification in polygons in {year}"
    vLabel.append(label)
    #print(label)

rows = pd.DataFrame({"varname":vName,"varlabel":vLabel})
desc = pd.concat([desc,rows], ignore_index=True)
# =============================================================== esa_landcover

# %%

# Modis Landcover ===============================================================
modisLandcover_url = "https://raw.githubusercontent.com/HendrixPeralta/bol_hdi_prediction/refs/heads/main/data/satellite/collab_satellite_data/gee_modis_landcover_2012-2016.csv"

modisLandcover = pd.read_csv(modisLandcover_url)
db = db.merge(modisLandcover, left_on="asdf_id", right_on="id")
db.drop(columns="id", inplace=True)

# %%
vName = modisLandcover.columns[~modisLandcover.columns.str.contains("id")].to_list()

labels = ["agricultural land MODIS, total pixels divided by green Pixels",
          "total pixels",
          "urban land MODIS, total pixels divided by gray Pixels"]
years = range(2012,2017)
vLabel = []
for year in years: 
    for label in labels:
        label = label +" in "+str(year)
        print(label)
        vLabel.append(label)

rows = pd.DataFrame({"varname":vName, "varlabel":vLabel})
desc = pd.concat([desc,rows], ignore_index=True)
# =============================================================== Modis Landcover

# Coast Distance ===============================================================
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
