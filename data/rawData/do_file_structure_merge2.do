*Merge NTL (.dta) with Poly_ID to create a new column and identify municipalities departments	
clear 
use bd_ntl_corrected.dta
rename namegq mun
keep asdf_id mun
merge m:m mun using bd_polyid_Stata15_corrected.dta
	tab _merge
	replace asdf_id=57 if depmun=="Beni-San Javier"
	replace asdf_id=264 if depmun=="Santa Cruz-San Javier"
	replace asdf_id=222 if depmun=="Pando-San Pedro"
	replace asdf_id=58 if depmun=="Santa Cruz-SanPedro"
	replace asdf_id=299 if poly_id==152
	replace asdf_id=72 if poly_id==249
	drop if missing(poly_id)
save "/Users/pedro/Documents/GitHub/project2021o/data/rawData/bd_ntl_corrected.dta", replace

use bd_ntl_corrected.dta
keep asdf_id mun
merge m:m mun using bd_polyid_Stata15_corrected.dta
	tab _merge
	replace asdf_id=176 if poly_id==30
save "/Users/pedro/Documents/GitHub/project2021o/data/rawData/bd_ntl_corrected.dta", replace

*Merge NTL.corrected(dta.) with poly_id.corrected (.dta)
clear
use bd_ntl_corrected.dta
keep asdf_id mun poly_id depmun
merge 1:1 poly_id using bd_polyid_Stata15_corrected.dta
	sort asdf_id
	tab _merge
save "/Users/pedro/Documents/GitHub/project2021o/data/rawData/bd_ntl_corrected.dta", replace
