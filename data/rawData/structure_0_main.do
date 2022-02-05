cd /Users/pedro/Documents/GitHub/project2021o/data/rawData

*1. Concatenación de base de datos 1 Atlas
*Usar Base de datos Atlas Municipal
use BaseDatosAtlasMunicipalODSBolivia2020_Stata15.dta 
*Concatenar datos de Atlas Municipal
egen uniquename = concat (municipio dep), punct(-)
save as BaseDatosAtlasMunicipalODSBolivia2020_Stata15_COPY.dta 

*2. Concatenación de base de datos POLYID
*Usar Base de datos POLYID
use POLYID.csv
egen uniquename = concat (mun departamen), punct(-)

*3. Merge 1:1
use BaseDatosAtlasMunicipalODSBolivia2020_Stata15_COPY.dta
merge 1:1 uniquename using POLYID.csv
