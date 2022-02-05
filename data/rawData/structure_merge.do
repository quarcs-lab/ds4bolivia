*Merge atlas municipal corrected (.dta) con polyid corrected (.dta)
*Fusionar municipal atlas corregido (.dta) con polyid corrgido(.dta)
clear
use bd_atlasmunicipalodsbolivia2020_Stata15_corrected.dta
keep id municipio dep depmun
merge 1:1 depmun using bd_polyid_Stata15_corrected.dta
	tab _merge
	*256 merged (first round)
	*289 merged *second round)

