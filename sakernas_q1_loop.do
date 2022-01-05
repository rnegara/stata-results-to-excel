gl dirwork "C:\Users\RadiNegara\Documents\tes"
set more off
cd "$dirwork" 
log using mylog1 , replace

**2001 sakernas**
insheet using "$dirwork\sakernas01aug.csv",clear

*age
keep if umur>=15
g age_1524=inrange(umur,15,24)

*employed status
/*if respondent worked during the previous week OR
had a job but temporarily not working during the previous week */

g employed=b4p2a1==1 | b4p3==1
g emp_urban=employed==1 & b1p05==1
replace emp_urban=. if b1p05==2
g emp_rural=employed==1 & b1p05==2
replace emp_rural=. if b1p05==1

g employed_inf=employed==1 & inlist(b4p10,1,5,6,7)
replace employed_inf=. if employed==0
g empinf_urban=employed_inf==1 & b1p05==1
replace empinf_urban=. if b1p05==2
replace empinf_urban=. if employed_inf==.
g empinf_rural=employed_inf==1 & b1p05==2
replace empinf_rural=. if b1p05==1
replace empinf_rural=. if employed_inf==.

*unemployed status
/*if respondent does not have a job but is still actively looking for a job
OR establishing a new business
OR have given up hope of finding a job 
OR have a future job arranged (have a job but has not started it yet) */

g unemployed=b4p4==1 | b4p5==1 | inlist(b4p21,1,2)
replace unemployed=0 if employed==1
replace unemployed=. if unemployed==0 & employed==0
g unemp_urban=unemployed==1 & b1p05==1
replace unemp_urban=. if b1p05==2
replace unemp_urban=. if unemployed==.
g unemp_rural=unemployed==1 & b1p05==2
replace unemp_rural=. if b1p05==1
replace unemp_urban=. if unemployed==.

*laborforce status
g lab_force=employed==1 | unemployed==1
g lforce_urban=lab_force==1 & b1p05==1
replace lforce_urban=. if b1p05==2
g lforce_rural=lab_force==1 & b1p05==2
replace lforce_rural=. if b1p05==1

*Set output
local variables employed emp_urban emp_rural unemployed unemp_urban unemp_rural lab_force lforce_urban lforce_rural employed_inf empinf_urban empinf_rural
local j_rows=12
local k_columns=6
mat m = J(`j_rows',`k_columns',.)

local y=1

foreach var of varlist `variables' {
	sum `var' [fw=weight]
	mat m[`y',1] = round(r(mean),.0004)
	sum `var' if jk==1 [fw=weight]
	mat m[`y',2] = round(r(mean),.0004)
	sum `var' if jk==2 [fw=weight]
	mat m[`y',3] = round(r(mean),.0004)
	su `var' if age_1524==1 [fw=weight]
	mat m[`y',4] = round(r(mean),.0004)
	su `var' if age_1524==1 & jk==1 [fw=weight]
	mat m[`y',5] = round(r(mean),.0004)
	su `var' if age_1524==1 & jk==2 [fw=weight]
	mat m[`y',6] = round(r(mean),.0004)
	local y=`y'+1
}

mat colnames m = "Total Pop 15+" "Men Pop 15+" "Women Pop 15+" "Total Youth 15-24" "Men Youth 15-24" "Women Youth 15-24"
mat rownames m = "Employment Rate (Total)" "Urban" "Rural" "Unemployment Rate (Total)" "Urban" "Rural" "Labor Force Rate (Total)" "Urban" "Rural" "Informal Employment Rate (Total)" "Urban" "Rural"
mat2txt, matrix(m) saving("$dirwork\q1_2001a.xls") replace



**2011 sakernas**
insheet using "$dirwork\sakernas11aug.csv",clear

*age
*g age_15plus=umur>=15
g age_1524=inrange(umur,15,24)

*employed status
/*if respondent worked during the previous week OR
had a job but temporarily not working during the previous week */

g employed=b5p2a1==1 | b5p3==1 
g emp_urban=employed==1 & b1p05==1
replace emp_urban=. if b1p05==2
g emp_rural=employed==1 & b1p05==2
replace emp_rural=. if b1p05==1

g employed_inf=employed==1 & inlist(b5p12,1,5,6,7)
replace employed_inf=. if employed==0
g empinf_urban=employed_inf==1 & b1p05==1
replace empinf_urban=. if b1p05==2
replace empinf_urban=. if employed_inf==.
g empinf_rural=employed_inf==1 & b1p05==2
replace empinf_rural=. if b1p05==1
replace empinf_rural=. if employed_inf==.

*unemployed status
/*if respondent does not have a job but is still actively looking for a job
OR establishing a new business
OR have given up hope of finding a job 
OR have a future job arranged (have a job but has not started it yet) */

g unemployed=b5p4==1 | b5p5==1 | inlist(b5p6,1,2)
replace unemployed=0 if employed==1
replace unemployed=. if unemployed==0 & employed==0
g unemp_urban=unemployed==1 & b1p05==1
replace unemp_urban=. if b1p05==2
replace unemp_urban=. if unemployed==.
g unemp_rural=unemployed==1 & b1p05==2
replace unemp_rural=. if b1p05==1
replace unemp_urban=. if unemployed==.

*laborforce status
g lab_force=employed==1 | unemployed==1
g lforce_urban=lab_force==1 & b1p05==1
replace lforce_urban=. if b1p05==2
g lforce_rural=lab_force==1 & b1p05==2
replace lforce_rural=. if b1p05==1

*Set output
local variables employed emp_urban emp_rural unemployed unemp_urban unemp_rural lab_force lforce_urban lforce_rural employed_inf empinf_urban empinf_rural
local j_rows=12
local k_columns=6
mat m = J(`j_rows',`k_columns',.)

local y=1

foreach var of varlist `variables' {
	sum `var' [fw=weight]
	mat m[`y',1] = round(r(mean),.0004)
	sum `var' if jk==1 [fw=weight]
	mat m[`y',2] = round(r(mean),.0004)
	sum `var' if jk==2 [fw=weight]
	mat m[`y',3] = round(r(mean),.0004)
	su `var' if age_1524==1 [fw=weight]
	mat m[`y',4] = round(r(mean),.0004)
	su `var' if age_1524==1 & jk==1 [fw=weight]
	mat m[`y',5] = round(r(mean),.0004)
	su `var' if age_1524==1 & jk==2 [fw=weight]
	mat m[`y',6] = round(r(mean),.0004)
	local y=`y'+1
}

mat colnames m = "Total Pop 15+" "Men Pop 15+" "Women Pop 15+" "Total Youth 15-24" "Men Youth 15-24" "Women Youth 15-24"
mat rownames m = "Employment Rate (Total)" "Urban" "Rural" "Unemployment Rate (Total)" "Urban" "Rural" "Labor Force Rate (Total)" "Urban" "Rural" "Informal Employment Rate (Total)" "Urban" "Rural"
mat2txt, matrix(m) saving("$dirwork\q1_2011a.xls") replace

log close
