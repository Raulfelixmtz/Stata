*Basics to make our life easier

global folder="dirección de las cosas"

cd "$folder"

use // the name of the database, clear

c.var indica es continua
i.var indica es binaria

esttab using table.csv, se replace

*se =standard errors
*Puede ser .csv, .xls, .doc o así. CSV da mejor formato, pero xls da menos problema
//el replace es para poder volver a correrlo sin que me marque

//_N total number of observations

global nameglobal var1 var2 var3

$nameglobal //asi lo llamamos

*todo lo que va después de la coma son caracteristicas.
histogram var1, percent
graph export histvar1.png 

twoway (scatter var1 var2)(lfit var1 var2), by(Region) //por dar un ejemplo

sum var1, d //d nos da percentiles d=de

return list //nos da los escalares 

local newname `r(p5)' //por dar un ejemplo

* recast changes the storage type of variables

*eststo stores a copy of the active estimation results for later tabulation. It is an alternative to official Stata's estimates store

*nostar quita los asteriscos
*noobs= no observaciones
*mtitles label= para que use lo de las variables. 

*## Para multiples regresiones y usando outreg2

reg vardep varindep
outreg2 using tabla.xls, replace stats(coef se ci)
reg varddep varindep1 varindep2
outreg2 using tabla.xls, append ctitle(regresion2) stats(coef se ci)

*el chiste es primero replace luego los append

ttest re78, by(treat) reverse
local diff=`r(mu_1)'-`r(mu_2)' 

mat A=[`diff' \ `r(se)'] /*poner en una matriz la diferencia de medias y su desviación estándar */
mat list A

*reverse         reverse group order for mean difference computation

psmatch2 treatment control1 control2, outcome(vardependant)
local pval = 2*ttail(`e(df_r)', abs(`r(att)'/`r(seatt)'))
matrix A = ( `r(att)' \ `r(seatt)' \ `pval' ) /*guardar en una matriz el estimador de PSM, su desviación estandar y su p-value */
mat list A

*Para multiples regresiones puedo usar eststo y al final esttab
*O el outreg2 replace, luego append
*No olvidar el using
