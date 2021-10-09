program define standard2
version 9
syntax varlist [if] [in],[hl(varlist)] [sd(real 1.0)]
quietly reg `varlist' `if' `in'
foreach var of varlist `varlist'  {
	quietly summarize `var' 
	local n = r(N)
	local m = r(mean)
	local s = sqrt(r(Var))
	
	tempvar `var'

	global var: permname std2_`var'
	quietly gen $var =(`var'-`m')/(2*`s') 
	label var $var "stand by 2 sd `var'"
	summarize $var 

	global var: permname mc_`var'
	quietly gen $var =`var'-`m' 
	label var $var "mean centered `var'"
	summarize $var 

	global var: permname log_`var'
	quietly gen $var =log(`var'+1) 
	label var $var "logged `var'"
	summarize $var 
}
end




