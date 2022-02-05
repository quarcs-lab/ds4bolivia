*New vars at the Municipal Atlas of Sustainable Development Goals in Bolivia
*Nuevas variables en el Atlas Municipal de los Objetivos de Desarrollo Sostenible en Bolivia
quietly{
clear
use BaseDatosAtlasMunicipalODSBolivia2020_Stata15.dta
	*determine if a municipality has the same name in different department
	sort municipio
	quietly by municipio:  gen dup = cond(_N==1,0,_n) if (municipio!="-")
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
	drop dup
egen depmun = concat (dep municipio), punct(-)
save "C:\Users\Erick Gonzales\Documents\1_Contributions\2022_computational_notebook_muni_bol\project2021o\data\rawData\bd_atlasmunicipalodsbolivia2020_Stata15_corrected.dta", replace
}

*New vars at POLYID
*Nuevas variables en POLYID
*quietly{
clear
import delimited "C:\Users\Erick Gonzales\Documents\1_Contributions\2022_computational_notebook_muni_bol\project2021o\data\rawData\POLYID.csv"
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
	*do the above for all the cases	
egen depmun = concat (departamen mun), punct(-)
save "C:\Users\Erick Gonzales\Documents\1_Contributions\2022_computational_notebook_muni_bol\project2021o\data\rawData\bd_polyid_Stata15_corrected.dta", replace
*}
