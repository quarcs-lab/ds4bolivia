*Read data base GeoDS4Bolivia.dta
quietly
clear
use /Users/pedro/Documents/GitHub/project2021o/data/GeoDS4Bolivia.dta

quietly {
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
label variable sdg2_4_t "Tractor Density, 2013 (per 1,000 UPAs)"
label variable sdg3_1_p "Institutional delivery coverage, average 2008-2012 (%)"
label variable sdg3_2_mi "Infant mortality rate (< 1 year), 2016 (per. 1,000 live births)"
label variable sdg3_2_mn "Mortality rate in children (< 5 years), 2016 (per. 1,000 live births)"
label variable sdg3_3_c "Chagas disease infestation rate, 2017 (% of households)"
label variable sdg3_3_d "Dengue incidence, 2018 (per 10,000 population)"
label variable sdg3_3_m "Incidence of malaria, average 2014-17 (per 1,000 population)"
label variable sdg3_3_t "Incidence of tuberculosis, 2017 (per 100,000 population)"
label variable sdg3_3_vih " HIV incidence, average 2014-17 (per 1,000,00 population)"
label variable sdg3_7_fa "Adolescent fertility rate (15-19 years), 2012 (births per 1,000 women)"
label variable sdg4_1_ash "Secondary school dropout rate, male, 2017 (% of enrolled)"
label variable sdg4_1_asm "Secondary school dropout rate, females, 2017 (% of enrolled)"
label variable sdg4_4_es "Population with higher education (>= 19 years), 2012 (%)"
label variable sdg4_6_alfab "Literacy rate for (>= 15 years), 2012 (%)"
label variable sdg4_c_pci "Qualified teachers at the initial level, 2016 (%)"
label variable sdg4_c_pcs "Qualified teachers at the secondary level, 2016"
label variable sdg5_1_paes "Gender parity in school dropouts in  secondary school, 2017"
label variable sdg5_1_pej "Gender parity in years of education of young people (25-35 years old), 2012. (25-35 years), 2012"
label variable sdg5_1_ppm "Gender Parity in the Multidimensional Poverty Index, 2012"
label variable sdg5_5_pp "Gender parity in the overall participation rate (>=10 years), 2012"
label variable sdg6_1_ca "Drinking water coverage, 2017 (% of population)"
label variable sdg6_2_cs "Sanitation coverage, 2017 (% of population)"
label variable sdg6_3_tar "Wastewater treatment, 2017 (% of wastewater) wastewater)"

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
rename sdg3_1_p sdg3_1_idca
rename sdg3_2_mi sdg3_2_imr
rename sdg3_2_mn sdg3_2_mrc
rename sdg3_3_c sdg3_3_cdir
rename sdg3_3_d sdg3_3_di
rename sdg3_3_m sdg3_3_imr
rename sdg3_3_t sdg3_3_ti 
rename sdg3_3_vih sdg3_3_hivi
rename sdg3_7_fa sdg3_7_afr
rename sdg4_1_ash sdg4_1_ssdrm
rename sdg4_1_asm sdg4_1_ssdrf
rename sdg4_4_es sdg4_4_phe
rename sdg4_6_alfab sdg4_6_lr
rename sdg4_c_pci sdg4_c_qti
rename sdg4_c_pcs sdg4_c_qts
rename sdg5_1_paes sdg5_1_gpsd
rename sdg5_1_pej sdg5_1_gpyp
rename sdg5_1_ppm sdg5_1_gpmpi
rename sdg5_5_pp sdg5_5_gpop
rename sdg6_1_ca sdg6_1_dwc
rename sdg6_2_cs sdg6_2_sc
rename sdg6_3_tar sdg6_3_wwt
}
