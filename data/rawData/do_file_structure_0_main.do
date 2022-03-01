*Set path
*Establecer camino
cd /Users/pedro/Documents/GitHub/project2021o/data/rawData
*cd

*Obs.:
*In the main do file, please set a path (cd)
*For the subtitles of do files, let's write both in Spanish and English
*Let's name this file structure_0_main
*IMPORTANT: Let us not modify the original data
*IMPORTANT: Let us create working copies of the original data where changes can happen
*Save polyid as .dta

*New vars
*Nuevas variables
do do_file_structure_new_vars

*Merging
*Fusionar
do do_file_structure_merge

*Repeat new vars structure 
do do_file_structure_new_vars

*Second merging structure
do do_file_structure_merge2
