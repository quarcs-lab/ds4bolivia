*Read data base GeoDS4Bolivia.dta
quietly
clear
use /Users/pedro/Documents/GitHub/project2021o/data/GeoDS4Bolivia.dta

*Change variables labels
label variable imds "Municipal Sustainable Development Index"
label variable rank_imds "Bolivia Index Ranking"
label variable poblacion_2020 "Population 2020"
label variable urbano_2012 "Urbanization rate, 2012 (% of population)"
label variable sdg1_1_ee "Extreme energy poverty rate, 2016 (% of households)"
label variable sdg1_1_nbi "Unsatisfied Basic Needs, 2012 (% of population)"
label variable sdg1_2_pm " Multidimensional Poverty Index, 2012"
label variable sdg1_4_ssb "Access to the 3 basic services, 2012 (% of households)"
label variable sdg2_2_dm "Chronic malnutrition in children (< 5 years), 2016 (%)"
label variable sdg2_2_smu "Overweight in women (15-49 years), 2016 (%)"
label variable sdg2_4_su "Average area per Production Unit Agriculture and Livestock, 2013 (ha)"
label variabel sdg2_4_t "Tractor Density, 2013 (per 1,000 UPAs)"

*Rename variables name
rename poblacion_2020 population_2020
rename sdg1_1_ee sdg1_1_eepr
rename sdg1_1_nbi sdg1_1_ubn
rename sdg1_2_pm sdg1_2_mpi
rename sdg1_4_ssb sdg1_4_abs
rename sdg2_2_dm sdg2_2_cmc
rename sdg2_2_smu sdg2_2_oww
rename sdg2_4_su sdg2_4_pual
rename sdg2_4_t sdg2_4_td
