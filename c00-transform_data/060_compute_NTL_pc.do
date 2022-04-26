cls
**=====================================================
** Program Name: Compute NTL per capita
** Author: Carlos Mendez
** Date: 2022-04-26
** --------------------------------------------------------------------------------------------
** Inputs/Ouputs:
* Data files used:
                 * ../data/NTL_trends.dta
                 * ../data/Population_trends.dta

* Data files created as intermediate product:

* Data files created as final product:

**=====================================================

** 0. Change working directory
cd "/Users/carlosmendez/Documents/GitHub/project2021o/c00-transform_data"

** 1. Setup
clear all
macro drop _all
capture log close
set more off
version 15

** 2. Open log file
log using "060_compute_NTL_pc.txt", text replace

** 3. Install modules
*ssc install estout, replace all
*ssc install outreg2, replace all
*ssc install reghdfe, replace all * INFO: http://scorreia.com/software/reghdfe/
*net install gr0009_1, from (http://www.stata-journal.com/software/sj10-1) replace all
*net install tsg_schemes, from("https://raw.githubusercontent.com/asjadnaqvi/Stata-schemes/main/schemes/") replace all
*set scheme white_tableau, permanently
*set scheme gg_tableau, permanently


** 4. Import data
use "../data/Population_trends.dta", clear

describe
summarize

** Select observations from 2012-2020
keep if year > 2011

** Merge with NTL dataset
sort asdf_id year
merge 1:1 asdf_id year using "../data/NTL_trends.dta"
drop _merge

** Rescale NTL by 100,000,000 to be able to compute log (NTL/pop)


** X. Save dataset
save             "../data/NTLpc.dta", replace
export delimited "../data/NTLpc.csv", replace

** 99. Close log file
log close

**====================END==============================
 