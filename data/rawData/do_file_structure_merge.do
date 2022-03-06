*Merge atlas municipal corrected (.dta) con polyid corrected (.dta)
*Fusionar municipal atlas corregido (.dta) con polyid corregido(.dta)
clear
use bd_atlasmunicipalodsbolivia2020_Stata15_corrected.dta
keep id municipio dep depmun
merge 1:1 depmun using bd_polyid_Stata15_corrected.dta
tab _merge 
save bd_polyid_Stata15_corrected.dta, replace
	*256 merged (first round)
	*289 merged (second round)
	*339 merged (third round)
	drop _merge
save bd_polyid_Stata15_corrected.dta, replace

*Merge NTL.corrected(dta.) with poly_id.corrected (.dta)
clear
use bd_ntl_corrected.dta
keep asdf_id mun poly_id depmun
merge 1:1 poly_id using bd_polyid_Stata15_corrected.dta
	sort asdf_id
	tab _merge
	drop _merge
save bd_ntl_corrected.dta, replace

*Merge into atlas municipal corrected (.dta)
use bd_atlasmunicipalodsbolivia2020_Stata15_corrected.dta
merge 1:1 depmun using bd_ntl_corrected.dta
drop _merge
order id municipio dep depmun mun departamen poly_id asdf_id
drop mun departamen
save bd_atlasmunicipalodsbolivia2020_Stata15_full, replace
