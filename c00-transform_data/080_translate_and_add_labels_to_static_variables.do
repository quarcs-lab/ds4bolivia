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
label variable sdg7_1_cee "Electricity coverage, 2012 (% of population) population)"
label variable sdg7_1_cep "Residential electricity consumption per capita, 2016 (kWh/person/year)"
label variable sdg7_1_elc "Clean cooking energy, 2012 (% of households)"
label variable sdg7_3_ecep "CO2 emissions per capita by energy, 2016. (tCO2/person/year)"
label variable sdg8_4_mcc "Residential electric meters with zero consumption, 2016 (%)"
label variable sdg8_5_ph "Overall participation rate males (>= 10 years), 2012 (%)"
label variable sdg8_5_pm "Overall female participation rate (>= 10 years), 2012 (%)"
label variable sdg8_6_hnn "Men who do not study or participate in the labor market (15-24 years), 2012 (%)"
label variable sdg8_6_mnn "Women who do not study or participate in the labor market (15-24 years),2012 (%),2012 (%)"
label variable sdg8_10_b "Density of bank branches, 2018 (per 100,000 inhabitants)"
label variable sdg8_11_mm "Index of the degree of intermediation in migration, 2012"
label variable sdg9_1_rutas "Number of railways/primary roads entering/leaving the municipality, 2019"
label variable sdg9_5_c "Kuaa computers delivered, 2016 (per 100 school-age population, 6-19 years)"
label variable sdg9_5_pt "Educational units with technological floors, 2016 (%)"
label variable sdg9_c_crdm "Fixed and mobile network coverage, 2012 (% of households)"
label variable sdg9_c_rb "Density of radio bases, 2016 (number of radio bases per 1000 inhabitants)"
label variable sdg10_2_egini "GINI coefficient of years of education, 2012"
label variable sdg10_2_ge "Inequality in electricity consumption, 2016"
label variable sdg10_2_nhe "Non-Spanish speaking population (>= 3 years), 2012 (%)"
label variable sdg11_1_h "Overcrowding rate, 2012 (% of households)"
label variable sdg11_1_sss "Households that do not have a toilet, bathroom or latrine, 2012 (%) latrine, 2012 (%)"
label variable sdg11_2_atc "Seats available for mass transit, 2017 (per 1,000 inhabitants)"
label variable sdg13_1_vcc "Climate Change Vulnerability Index, 2015"
label variable sdg13_2_ectp "Total CO2 emissions per capita, 2016 (tCO2/person/year)"
label variable sdg13_2_td "Deforestation rate, average 2016-2018 (% of forest area 2015)"
label variable sdg15_1_ap "Protected areas, 2019 (% of the municipality's land area) municipality)"
label variable sdg15_5_pb "Biodiversity loss rate due to deforestation deforestation, average 2016-2018"
label variable sdg16_1_vh "Registered homicide rate, average 2015-2017. (per 100,000 inhabitants)"
label variable sdg16_6_ce "Programmed budget execution capacity, 2017 (%)"
label variable sdg16_9_nrc "Children registered in the civil registry (< 5 years), 2012 (%)"
label variable sdg17_1_il "Proportion of municipal revenues that come from local taxes, 2017 (%)"
label variable sdg17_5_ip "Public investment per capita, 2017 (Bs./person)"
label variable sdg1_1_ee_abs "Number of homes consuming <25% of the Dignity Tariff limit (210 kWh/year), 2016."
label variable sdg1_1_nbi_abs "Population with unsatisfied basic needs, 2012"
label variable sdg1_2_pm_abs "Number of households with deficiencies in 4 or more dimensions (out of 9)"
label variable sdg1_4_ssb_abs "Number of households lacking 1/3 basic services (electricity, water and sanitation),2012"
label variable sdg2_2_dm_abs "Num.children <5years with chronic malnutrition,2016(weighted by dept. and poverty)"
label variable sdg2_2_smu_abs "Num.women aged 15-49 years, overweight (BMI>=30), 2016 (by dept. and poverty)"
label variable sdg2_4_su_abs "Total area of agricultural production units, 2013 (ha)"
label variable sdg2_4_t_abs "Number of tractors in the municipality, 2013"
label variable sdg3_1_p_abs "Number of unattended deliveries in a health facility, 2012"
label variable sdg3_2_mi_abs "Number of children who died before their first birthday, 2016"
label variable sdg3_2_mn_abs "Number of children who died before their fifth birthday, 2016"
label variable sdg3_3_c_abs "Number of households infested with Chagas disease, 2017"
label variable sdg3_3_d_abs "Population with dengue, 2018"
label variable sdg3_3_m_abs "Number of reported malaria cases, average 2014-2017"
label variable sdg3_3_t_abs "Number of cases of tuberculosis in all forms, new and relapsed, 2017"
label variable sdg3_3_vih_abs "Number of HIV cases, 2014-2017"
label variable sdg3_7_fa_abs "Number of births per women aged 15-19 years, annual average, 2008-2012"
label variable sdg4_1_ash_abs "Number of male high school dropouts, 2017"
label variable sdg4_1_asm_abs "Number of female high school dropouts, 2017"
label variable sdg4_4_es_abs "Population aged 19 years and older with higher education attained, 2012"
label variable sdg4_6_alfab_~s "Population aged 15 and over who are not literate, 2012"
label variable sdg4_c_pci_abs "Number of unqualified teachers at the initial level, 2016"
label variable sdg4_c_pcs_abs "Number of unqualified teachers at the secondary level, 2016"
label variable sdg6_1_ca_abs "Population without drinking water coverage, 2017"
label variable sdg6_2_cs_abs "Population without basic sanitation coverage, 2017"
label variable sdg7_1_cee_abs "Population without electricity coverage, 2012"
label variable sdg7_1_cep_abs "Residential electricity consumption, 2016 (kWh)"
label variable sdg7_1_elc_abs "Number of households without clean energy for cooking, 2012"
label variable sdg7_3_ecep_abs "Total CO2 emissions by energy, 2016 (tCO2/year)"
label variable sdg8_4_mcc_abs "Residential electric meters with zero consumption, 2016 (%)"

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
rename sdg7_1_cee sdg7_1_ec
rename sdg7_1_cep sdg7_1_rec
rename sdg7_1_elc sdg7_1_cce
rename sdg7_3_ecep sdg7_3_co2epc
rename sdg8_4_mcc sdg8_4_rem
rename sdg8_5_ph sdg8_5_oprm
rename sdg8_5_pm sdg8_5_ofrm
rename sdg8_6_hnn sdg8_6_mlm
rename sdg8_6_mnn sdg8_6_wlm
rename sdg8_10_b sdg8_10_dbb
rename sdg8_11_mm sdg8_11_idi
rename sdg9_1_rutas sdg9_1_routes
rename sdg9_5_c sdg9_5_cd
rename sdg9_5_pt sdg9_5_eutf
rename sdg9_c_crdm sdg9_c_mnc
rename sdg9_c_rb sdg9_c_drb
rename sdg10_2_egini sdg10_2_gcye 
rename sdg10_2_ge sdg10_2_iec
rename sdg10_2_nhe sdg10_2_nssp
rename sdg11_1_h sdg11_1_hocr
rename sdg11_1_sss sdg11_1_hno
rename sdg11_2_atc sdg11_2_samt
rename sdg13_1_vcc sdg13_1_ccvi
rename sdg13_2_ectp sdg13_2_tco2e
rename sdg13_2_td sdg13_2_dra
rename sdg15_1_ap sdg15_1_pa
rename sdg15_5_pb sdg15_5_blr
rename sdg16_1_vh sdg16_1_rhr
rename sdg16_6_ce sdg16_6_pbec
rename sdg16_9_nrc sdg16_9_cr
rename sdg17_1_il sdg17_1_pmtax
rename sdg17_5_ip sdg17_5_pipc
rename sdg1_1_ee_abs sdg1_1_dtl_abs
rename sdg1_1_nbi_abs sdg1_1_pubn_abs
rename sdg1_2_pm_abs sdg1_2_dd_abs
rename sdg1_4_ssb_abs sdg1_4_ebs_abs
rename sdg2_2_dm_abs sdg2_2_cm_abs
rename sdg2_2_smu_abs sdg2_2_wow_abs
rename sdg2_4_su_abs sdg2_4_apu_abs
rename sdg2_4_t_abs sdg2_4_tm_abs
rename sdg3_1_p_ab sdg3_1_udhf_ab
rename sdg3_2_mi_abs sdg3_2_fb_abs
rename sdg3_2_mn_abs sdg3_2_ffb_abs
rename sdg3_3_c_abs sdg3_3_cd_abs
rename sdg3_3_d_abs sdg3_3_pd_abs
rename sdg3_3_m_abs sdg3_3_mc_abs
rename sdg3_3_t_abs sdg3_3_tc_abs
rename sdg3_3_vih_abs sdg3_3_vih_abs 
rename sdg3_7_fa_abs sdg3_7_bpw_abs
rename sdg4_1_ash_abs sdg4_1_mhs_abs
rename sdg4_1_asm_abs sdg4_1_fhs_abs
rename sdg4_4_es_abs sdg4_4_heu_abs
rename sdg4_6_alfab_~s sdg4_6_pnl_abs
rename sdg4_c_pci_abs sdg4_c_uti_abs
rename sdg4_c_pcs_abs sdg4_c_uts_abs
rename sdg6_1_ca_abs sdg6_1_wdc_abs
rename sdg6_2_cs_abs sdg6_2_bsc_abs
rename sdg7_1_cee_abs sdg7_1_wec_abs
rename sdg7_1_cep_abs sdg7_1_rec_abs
rename sdg7_1_elc_abs sdg7_1_cec_abs
rename sdg7_3_ecep_abs sdg7_3_tee_abs
rename sdg8_4_mcc_abs sdg8_4_rem_abs
}
save GeoDS4Bolivia, replace
