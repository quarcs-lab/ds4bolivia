*New vars at the Municipal Atlas of Sustainable Development Goals in Bolivia
*Nuevas variables en el Atlas Municipal de los Objetivos de Desarrollo Sostenible en Bolivia
quietly
clear
use BaseDatosAtlasMunicipalODSBolivia2020_Stata15.dta
	*determine if a municipality has the same name in different department
	sort municipio
	quietly by municipio:  gen dup = cond(_N==1,0,_n) if (municipio!="-")
quietly {	
	list dep municipio if dup>=1
	*yes, the following cases were found, we need unique values for department and municipality
	*     |        dep    municipio |
	*     |-------------------------|
	*     | Santa Cruz    El Puente |
	*     |     Tarija    El Puente |
	*     |     Tarija   Entre Ríos |
	*     | Cochabamba   Entre Ríos |
	*     | Santa Cruz   San Javier |
	*     |-------------------------|
	*     |       Beni   San Javier |
	*     |      Pando    San Pedro |
	*     | Santa Cruz    San Pedro |
	*     |       Beni    San Ramón |
	*     | Santa Cruz    San Ramón |
	*     |-------------------------|
	*     |       Beni   Santa Rosa |
	*     |      Pando   Santa Rosa |
		}
	drop dup
egen depmun = concat (dep municipio), punct(-)
*save "C:\Users\Erick Gonzales\Documents\1_Contributions\2022_computational_notebook_muni_bol\project2021o\data\rawData\bd_atlasmunicipalodsbolivia2020_Stata15_corrected.dta"
save "/Users/pedro/Documents/GitHub/project2021o/data/rawData/C:\Users\Erick Gonzales\Documents\1_Contributions\2022_computational_notebook_muni_bol\project2021o\data\rawData\bd_atlasmunicipalodsbolivia2020_Stata15_corrected.dta", replace 

*New vars at POLYID
*Nuevas variables en POLYID
*quietly{
clear
import delimited "/Users/pedro/Documents/GitHub/project2021o/data/rawData/POLYID.csv"
	*determine if a municipality has the same name in different department
	sort mun
	quietly by mun:  gen dup = cond(_N==1,0,_n) if (mun!="-")
	list dep mun if dup>=1
	*yes, the following cases were found, we need unique values for department and municipality
	*     | departamen             mun |
	*     |----------------------------|
	*     |     Tarija       El Puente |
	*     | Santa Cruz       El Puente |
	*     |     Tarija   Entre R<ed>os |
	*     | Cochabamba   Entre R<ed>os |
	*     |       Beni      San Javier |
	*     |----------------------------|
	*     | Santa Cruz      San Javier |
	*     | Santa Cruz       San Pedro |
	*     |      Pando       San Pedro |
	*     | Santa Cruz    San Ram<f3>n |
	*     |       Beni    San Ram<f3>n |
	*     |----------------------------|
	*     |       Beni      Santa Rosa |
	*     |      Pando      Santa Rosa |
	drop dup
	*256 merged (first round)
	*fixing name for Potosí
	replace departamen="Potosí" if departamen=="Potosi"
save "/Users/pedro/Documents/GitHub/project2021o/data/rawData/bd_polyid_Stata15_corrected.dta", replace
	*289 merged (second round)
	split mun, gen(tempvar) parse("<")
	drop tempvar1
	gen tempvar = substr(tempvar2,1,2)
	drop tempvar2
	tab tempvar
	preserve
	drop if missing(tempvar)
	sort tempvar
	quietly by temp:  gen dup = cond(_N==1,0,_n) if (tempvar!="-")
	list mun tempvar if dup<=2
	*the following cases were found
	*     +------------------------------------+
	*     |                      mun   tempvar |
	*     |------------------------------------|
	*     |       Waldo Ballivi<e1>n        e1 |
	*     |         Puerto Su<e1>rez        e1 |
	*     |    Bel<e9>n de Andamarca        e9 |
	*     |          Puerto P<e9>rez        e9 |
	*     |  San Juan de Yapacan<ed>        ed |
	*     |------------------------------------|
	*     |                 Ocur<ed>        ed |
	*     |               Chara<f1>a        f1 |
	*     |               Zuda<f1>ez        f1 |
	*     |            Exaltaci<f3>n        f3 |
	*     | Ascensi<f3>n de Guarayos        f3 |
	*     |------------------------------------|
	*     |      Jes<fa>s de Machaca        fa |
	drop dup
	restore
	drop tempvar
	replace mun = subinstr(mun,"<e1>","á",.)
	replace mun = subinstr(mun,"<e9>","é",.)
	replace mun = subinstr(mun,"<ed>","í",.)
	replace mun = subinstr(mun,"<f1>","ñ",.)
	replace mun = subinstr(mun,"<f3>","ó",.)
	replace mun = subinstr(mun,"<fa>","ú",.)
	*do the above for all the cases	
egen depmun = concat (departamen mun), punct(-)
*save "C:\Users\Erick Gonzales\Documents\1_Contributions\2022_computational_notebook_muni_bol\project2021o\data\rawData\bd_atlasmunicipalodsbolivia2020_Stata15_corrected.dta"
save "/Users/pedro/Documents/GitHub/project2021o/data/rawData/bd_polyid_Stata15_corrected.dta", replace
*}


*Crear base de datos NTL.dta 
*Create data base NTL.dta
quietly
clear 
import delimited "/Users/pedro/Documents/GitHub/project2021o/data/rawData/NTL.csv"
*Correct typing errors		
		split namegq, gen(tempvar) parse("Ã")
	drop tempvar1
	gen tempvar = substr(tempvar2,1,2)
	drop tempvar2
	tab tempvar
	preserve
	drop if missing(tempvar)
	sort tempvar
	quietly by temp:  gen dup = cond(_N==1,0,_n) if (tempvar!="-")
*identify errors	
	*list namegq tempvar if dup<=2
 *    |                 namegq   tempvar |
 *   |----------------------------------|
 *1. |      FernÃ¡ndez Alonso         ¡ |
 *2. |                AlcalÃ¡         ¡ |
 *8. |         Colpa BÃ©lgica         © |
 *9. |                RoborÃ©         © |
 *17. |            Entre RÃ­os         ­ |
 *   |----------------------------------|
 *18. |             MacharetÃ­         ­ |
 *32. |               ZudaÃ±ez         ± |
 *33. |        Cuatro CaÃ±adas         ± |
 *38. | AscenciÃ³n de Guarayos         ³ |
 *39. |            ConcepciÃ³n         ³ |
 *    |----------------------------------|
 *47. |      JesÃºs de Machaka         º |
 *    +----------------------------------+

	drop dup
	restore
	drop tempvar
*correct first errors market as Ã
	replace namegq = subinstr(namegq,"Ã","í",.)
	sort namegq
save "/Users/pedro/Documents/GitHub/project2021o/data/rawData/NTL_corrected.dta", replace	
*identify other errors containing Ã(+ another character)	
	use /Users/pedro/Documents/GitHub/project2021o/data/rawData/NTL_corrected.dta
		split namegq, gen(tempvari) parse("í")
	drop tempvari1
	gen tempvari = substr(tempvari2,1,2)
	drop tempvari2
	tab tempvari
	preserve
	drop if missing(tempvari)
	sort tempvari
	quietly by temp:  gen dup = cond(_N==1,0,_n) if (tempvari!="-")
	*list namegq tempvari if dup<=2
	drop dup
	restore
	drop tempvari
*correct new errors
	sort namegq
	replace namegq = subinstr(namegq,"í¡","á",.)
	replace namegq = subinstr(namegq,"í©","é",.)
	replace namegq = subinstr(namegq,"í±","ñ",.)
	replace namegq = subinstr(namegq,"í³","ó",.)
	replace namegq = subinstr(namegq,"íº","ú",.)
	replace namegq= "San Ignacio" if namegq=="San Igcio"
	replace namegq= "Colpa Belgica" if namegq=="Colpa Bélgica"
	replace namegq= "Choque Cota" if namegq=="Choquecota"
	replace namegq= "Chuquihuta" if namegq=="Chuquihuta Ayllu Jucumani"
	replace namegq= "Collana" if namegq=="Colla"
	replace namegq= "Coro Coro" if namegq=="Corocoro"
	replace namegq= "Copacabana" if namegq=="Copacaba"
	replace namegq= "Gral. Saavedra" if namegq=="General Saavedra"
	replace namegq= "Guanay" if namegq=="Guay"
	replace namegq= "Humanata" if namegq=="Humata"
	replace namegq= "Irupana" if namegq=="Irupa"
	replace namegq= "Jesús de Machaca" if namegq=="Jesús de Machaka"
	replace namegq= "Magdalena" if namegq=="Magdale"
	replace namegq= "Okinawa Uno" if namegq=="Okiwa Uno"
	replace namegq= "Pari-Paria-Soracachi" if namegq=="Paria"
	replace namegq= "Pocona" if namegq=="Poco"
	replace namegq= "Postrer Valle" if namegq=="Postrervalle"
	replace namegq= "Puerto Carabuco" if namegq=="Puerto Mayor de Carabuco"
	replace namegq= "Puerto Suárez" if namegq=="Puerto Suarez"
	replace namegq= "Puna" if namegq=="Pu"
	replace namegq= "Rurrenabaque" if namegq=="Puerto Menor de Rurrebaque"
	replace namegq= "Saipina" if namegq=="Saipi"
	replace namegq= "Salinas de Garci Mendoza" if namegq=="Salis de Garcí­ Mendoza"
	replace namegq= "San Antonio de Lomerío" if namegq=="San Antonio de Lomerio"
	replace namegq= "San José de Chiquitos" if namegq=="San José"
	replace namegq= "San Juan de Yapacaní" if namegq=="San Juan"
	replace namegq= "San Miguel de Velasco" if namegq=="San Miguel"
	replace namegq= "San Pablo de Lípez" if namegq=="San Pablo"
	replace namegq= "San Pedro de Tiquina" if namegq=="San Pedro de Tiqui"
	replace namegq= "Santa Ana de Yacuma" if namegq=="Santa A"
	replace namegq= "Quillacas" if namegq=="Santuario de Quillacas"
	replace namegq= "Sica Sica" if namegq=="Sicasica"
	replace namegq= "Sipe Sipe" if namegq=="Sipesipe"
	replace namegq= "Sopachuy" if namegq=="Sopachui"
	replace namegq= "Tiahuanacu" if namegq=="Tiahuacu"
	replace namegq= "Toko" if namegq=="Toco"
	replace namegq= "Tomina" if namegq=="Tomi"
	replace namegq= "Urubichá" if namegq=="Urubicha"
	replace namegq= "Villa de Sacaca" if namegq=="Sacaca"
	replace namegq= "Villa Nueva-Loma Alta" if namegq=="Villa Nueva"
	replace namegq= "Villa Tunari" if namegq=="Villa Turi"
	replace namegq= "Villamontes" if namegq=="Villa Montes"
	replace namegq= "Vitichi" if namegq=="Vitiche"
	replace namegq= "Yanacachi" if namegq=="Yacachi"
	replace namegq= "Nazacara de Pacajes" if namegq=="zacara de Pacajes"
	replace namegq= "Buena Vista" if namegq=="Bue Vista"
	replace namegq= "Caranavi" if namegq=="Caravi"
	replace namegq= "Culpina" if namegq=="Culpi"
	replace namegq= "Carmen Rivero Tórrez" if namegq=="El Carmen Rivero Tórrez"
	replace namegq= "Icla" if namegq=="Villa Ricardo Mugia - Icla"
	replace namegq= "Mairana" if namegq=="Maira"
	replace namegq= "Moro Moro" if namegq=="Moromoro"
	replace namegq= "Pocona" if namegq=="Poco"
	replace namegq= "Punata" if namegq=="Puta"
	replace namegq= "Shinahota" if namegq=="Shihota"
	replace namegq= "El Sena" if namegq=="Se"
	replace namegq= "Ancoraimes" if namegq=="Villa Ancoraimes"
	replace namegq= "Callapa" if namegq=="Santiago de Callapa"
	replace namegq= "San Andrés de Machaca" if namegq=="La (Marka) San Andrés de Mach"
	replace namegq= "Santiago de Andamarca" if namegq=="Andamarca"
	replace namegq= "Villa Alcalá" if namegq=="Alcalá"	
	replace namegq= "San Pedro de Totora" if asdf_id==64
	replace namegq= "San Pedro de Buena Vista" if asdf_id==40
	replace namegq= "Santa Rosa del Sara" if asdf_id==69
	replace namegq= "Independencia" if namegq=="Ayopaya"
	replace namegq= "Cuchumuela" if namegq=="Villa Gualberto Villarroel"
	replace namegq= "Muyupampa" if namegq=="Villa Vaca Guzmán"
	replace namegq= "Villa San Lorenzo" if asdf_id==97
	replace namegq= "Guaqui" if namegq=="Puerto Mayor de Guaqui"
	replace namegq= "San Buenaventura" if namegq=="San Buenventura"
	replace namegq= "Waldo Ballivián" if namegq=="Waldo Ballivian"
	replace namegq= "Yunguyo de Litoral" if namegq=="Yunguyo del Litoral"
	replace namegq= "Bolívar" if namegq=="Bolivar"
	replace namegq= "San Agustín" if namegq=="San Agustí­n"
	replace namegq= "Ascensión de Guarayos" if namegq=="Ascención de Guarayos"
	replace namegq= "Caraparí" if namegq=="Caraparí­"
	replace namegq= "Chaquí" if namegq=="Chaquí­"
	replace namegq= "Guayaramerín" if namegq=="Guayaramerí­n"
	replace namegq= "Macharetí" if namegq=="Macharetí­"
	replace namegq= "Ocurí" if namegq=="Ocurí­"
	replace namegq= "Potosí" if namegq=="Potosí­"
	replace namegq= "San Joaquín" if namegq=="San Joaquí­n"
	replace namegq= "San Matías" if namegq=="San Matí­as"
	replace namegq= "San Pedro Cuarahuara" if namegq=="San Pedro de Curahuara"
	replace namegq= "Tapacarí" if namegq=="Tapacarí­"
	replace namegq= "Uncía" if namegq=="Uncí­a"
	replace namegq= "San Buenaventura" if namegq=="San Bueventura"
	replace namegq= "Yapacaní" if namegq=="Yapacaní­"
	replace namegq= "San Ignacio de Velasco" if asdf_id==293
	replace namegq= "Huari" if asdf_id==10
	replace namegq= "Huarina" if asdf_id==237
	save "/Users/pedro/Documents/GitHub/project2021o/data/rawData/NTL_corrected.dta", replace
quietly {
clear
use NTL_corrected.dta
	*determine if a municipality has the same name in different department
	sort namegq
	quietly by namegq:  gen dup = cond(_N==1,0,_n) if (namegq!="-")
	list asdf_id namegq if dup>=1
* +-----------------------+
*     | asdf_id        namegq |
*     |-----------------------|
* 98. |     319     El Puente |
* 99. |      98     El Puente |
*103. |     299   Entre Rí­os |
*104. |      72   Entre Rí­os |
*230. |      56   San Ignacio |
*     |-----------------------|
*231. |     293   San Ignacio |
*232. |     264    San Javier |
*233. |      57    San Javier |
*238. |     147   San Lorenzo |
*239. |      97   San Lorenzo |
*     |-----------------------|
*244. |     222     San Pedro |
*245. |      58     San Pedro |
*252. |      74     San Ramón |
*253. |     263     San Ramón |
*256. |     148    Santa Rosa |
*     |-----------------------|
*257. |     224    Santa Rosa |
*     +-----------------------+
* Second round
		drop dup
*save "C:\Users\Erick Gonzales\Documents\1_Contributions\2022_computational_notebook_muni_bol\project2021o\data\rawData\bd_atlasmunicipalodsbolivia2020_Stata15_corrected.dta"
save "/Users/pedro/Documents/GitHub/project2021o/data/rawData/NTL_corrected.dta", replace
}

*Merge NTL (.dta) with Poly_ID to create a new column and identify municipalities departments	
clear 
use NTL_corrected.dta
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
save "/Users/pedro/Documents/GitHub/project2021o/data/rawData/NTL_corrected.dta", replace

use NTL_corrected.dta
keep asdf_id mun
merge m:m mun using bd_polyid_Stata15_corrected.dta
	tab _merge
	replace asdf_id=176 if poly_id==30
save "/Users/pedro/Documents/GitHub/project2021o/data/rawData/NTL_corrected.dta", replace
quietly {
*.         tab _merge
*
*                 _merge |      Freq.     Percent        Cum.
*------------------------+-----------------------------------
*        master only (1) |         28        7.53        7.53
*         using only (2) |         33        8.87       16.40
*            matched (3) |        311       83.60      100.00
*------------------------+-----------------------------------
*                  Total |        372      100.00
	*first round
	
*.         tab _merge
*
*                _merge |      Freq.     Percent        Cum.
*------------------------+-----------------------------------
*        master only (1) |         28        7.59        7.59
*         using only (2) |         30        8.13       15.72
*            matched (3) |        311       84.28      100.00
*------------------------+-----------------------------------
*                  Total |        369      100.00
	*second round
 
*			tab _merge
*
*                _merge |      Freq.     Percent        Cum.
*------------------------+-----------------------------------
*        master only (1) |         25        6.85        6.85
*         using only (2) |         26        7.12       13.97
*            matched (3) |        314       86.03      100.00
*------------------------+-----------------------------------
*                  Total |        365      100.00
	*third round
	
*			tab _merge
*
*                 _merge |      Freq.     Percent        Cum.
*------------------------+-----------------------------------
*        master only (1) |         20        5.56        5.56
*         using only (2) |         21        5.83       11.39
*            matched (3) |        319       88.61      100.00
*------------------------+-----------------------------------
*                  Total |        360      100.00
	*fourth round
	
*		tab _merge
*
*                 _merge |      Freq.     Percent        Cum.
*------------------------+-----------------------------------
*        master only (1) |         19        5.29        5.29
*         using only (2) |         20        5.57       10.86
*            matched (3) |        320       89.14      100.00
*------------------------+-----------------------------------
*                  Total |        359      100.00
	*fifth round
	
*         tab _merge
*
*                 _merge |      Freq.     Percent        Cum.
*------------------------+-----------------------------------
*        master only (1) |          5        1.45        1.45
*         using only (2) |          6        1.74        3.19
*            matched (3) |        334       96.81      100.00
*------------------------+-----------------------------------
*                  Total |        345      100.00
		*sixth round
		
*		tab _merge
*
*                 _merge |      Freq.     Percent        Cum.
*------------------------+-----------------------------------
*        master only (1) |          4        1.16        1.16
*         using only (2) |          5        1.45        2.62
*            matched (3) |        335       97.38      100.00
*------------------------+-----------------------------------
*                  Total |        344      100.00
		*seventh round

*        tab _merge
*
*                 _merge |      Freq.     Percent        Cum.
*------------------------+-----------------------------------
*        master only (1) |          2        0.59        0.59
*         using only (2) |          2        0.59        1.17
*            matched (3) |        337       98.83      100.00
*------------------------+-----------------------------------
*                  Total |        341      100.00
		*Eighth round
*		tab _merge
*
*                 _merge |      Freq.     Percent        Cum.
*------------------------+-----------------------------------
*        master only (1) |          2        0.59        0.59
*            matched (3) |        339       99.41      100.00
*------------------------+-----------------------------------
*                  Total |        341      100.00
		*Ninth round
		 
*		 tab _merge
*
*                _merge |      Freq.     Percent        Cum.
*------------------------+-----------------------------------
*            matched (3) |        339      100.00      100.00
*------------------------+-----------------------------------
*                  Total |        339      100.00
		*Tenth round
}
