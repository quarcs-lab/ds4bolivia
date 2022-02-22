do structure_new_vars
*Merge atlas municipal corrected (.dta) con polyid corrected (.dta)
*Fusionar municipal atlas corregido (.dta) con polyid corregido(.dta)
clear
use bd_atlasmunicipalodsbolivia2020_Stata15_corrected.dta
keep id municipio dep depmun
merge 1:1 depmun using bd_polyid_Stata15_corrected.dta
tab _merge
*save "C:\Users\Erick Gonzales\Documents\1_Contributions\2022_computational_notebook_muni_bol\project2021o\data\rawData\bd_atlasmunicipalodsbolivia2020_Stata15_corrected.dta"
save "/Users/pedro/Documents/GitHub/project2021o/data/rawData/bd_polyid_Stata15_corrected.dta", replace
	*256 merged (first round)
	*289 merged (second round)
	*339 merged (third round)

*Merge NTL.corrected(dta.) with atlas municipal.corrected (.dta)
*clear
*use NTL_corrected.dta
*keep asdf_id mun poly_id depmun
*merge m:m mun using bd_polyid_Stata15_corrected.dta
*save "/Users/pedro/Documents/GitHub/project2021o/data/rawData/NTL_corrected.dta", replace
