
gl dirwork "C:\Users\RadiNegara\Documents\tes"
set more off
cd "$dirwork" 
log using mylog1 , replace

**2001 sakernas**
insheet using "$dirwork\sakernas01aug.csv",clear

*age
g age_15plus=umur>=15
g age_1524=inrange(umur,15,24)

*employed status
/*if respondent worked during the previous week OR
had a job but temporarily not working during the previous week */

g employed=b4p2a1==1 | b4p3==1
g employed_inf=employed==1 & inlist(b4p10,1,5,6,7)

*unemployed status
/*if respondent does not have a job but is still actively looking for a job
OR establishing a new business
OR have given up hope of finding a job 
OR have a future job arranged (have a job but has not started it yet) */

g unemployed=b4p4==1 | b4p5==1 | inlist(b4p21,1,2)
replace unemployed=0 if employed==1

*laborforce status
g lab_force=employed==1 | unemployed==1

*Set output
local j_rows=12
local k_columns=6
mat m = J(`j_rows',`k_columns',.)


*employment rate of population 15+
*total
su employed if age_15plus==1 [fw=weight]
mat m[1,1] = round(r(mean),.0004)
su employed if age_15plus==1 & jk==1 [fw=weight]
mat m[1,2] = round(r(mean),.0004)
su employed if age_15plus==1 & jk==2 [fw=weight]
mat m[1,3] = round(r(mean),.0004)
*urban
su employed if age_15plus==1 & b1p05==1 [fw=weight]
mat m[2,1] = round(r(mean),.0004)
su employed if age_15plus==1 & jk==1 & b1p05==1 [fw=weight]
mat m[2,2] = round(r(mean),.0004)
su employed if age_15plus==1 & jk==2 & b1p05==1 [fw=weight]
mat m[2,3] = round(r(mean),.0004)
*rural
su employed if age_15plus==1 & b1p05==2 [fw=weight]
mat m[3,1] = round(r(mean),.0004)
su employed if age_15plus==1 & jk==1 & b1p05==2 [fw=weight]
mat m[3,2] = round(r(mean),.0004)
su employed if age_15plus==1 & jk==2 & b1p05==2 [fw=weight]
mat m[3,3] = round(r(mean),.0004)

*employment rate of population 15-24
*total
su employed if age_1524==1 [fw=weight]
mat m[1,4] = round(r(mean),.0004)
su employed if age_1524==1 & jk==1 [fw=weight]
mat m[1,5] = round(r(mean),.0004)
su employed if age_1524==1 & jk==2 [fw=weight]
mat m[1,6] = round(r(mean),.0004)
*urban
su employed if age_1524==1 & b1p05==1 [fw=weight]
mat m[2,4] = round(r(mean),.0004)
su employed if age_1524==1 & jk==1 & b1p05==1 [fw=weight]
mat m[2,5] = round(r(mean),.0004)
su employed if age_1524==1 & jk==2 & b1p05==1 [fw=weight]
mat m[2,6] = round(r(mean),.0004)
*rural
su employed if age_1524==1 & b1p05==2 [fw=weight]
mat m[3,4] = round(r(mean),.0004)
su employed if age_1524==1 & jk==1 & b1p05==2 [fw=weight]
mat m[3,5] = round(r(mean),.0004)
su employed if age_1524==1 & jk==2 & b1p05==2 [fw=weight]
mat m[3,6] = round(r(mean),.0004)

*unemployment rate of population 15+
*total
su unemployed if age_15plus==1 & lab_force==1 [fw=weight]
mat m[4,1] = round(r(mean),.0004)
su unemployed if age_15plus==1 & jk==1 & lab_force==1 [fw=weight]
mat m[4,2] = round(r(mean),.0004)
su unemployed if age_15plus==1 & jk==2 & lab_force==1 [fw=weight]
mat m[4,3] = round(r(mean),.0004)
*urban
su unemployed if age_15plus==1 & b1p05==1 & lab_force==1 [fw=weight]
mat m[5,1] = round(r(mean),.0004)
su unemployed if age_15plus==1 & jk==1 & b1p05==1 & lab_force==1 [fw=weight]
mat m[5,2] = round(r(mean),.0004)
su unemployed if age_15plus==1 & jk==2 & b1p05==1 & lab_force==1 [fw=weight]
mat m[5,3] = round(r(mean),.0004)
*rural
su unemployed if age_15plus==1 & b1p05==2 & lab_force==1  [fw=weight]
mat m[6,1] = round(r(mean),.0004)
su unemployed if age_15plus==1 & jk==1 & b1p05==2 & lab_force==1 [fw=weight]
mat m[6,2] = round(r(mean),.0004)
su unemployed if age_15plus==1 & jk==2 & b1p05==2 & lab_force==1 [fw=weight]
mat m[6,3] = round(r(mean),.0004)

*unemployment rate of population 15-24
*total
su unemployed if age_1524==1 & lab_force==1 [fw=weight]
mat m[4,4] = round(r(mean),.0004)
su unemployed if age_1524==1 & jk==1 & lab_force==1 [fw=weight]
mat m[4,5] = round(r(mean),.0004)
su unemployed if age_1524==1 & jk==2 & lab_force==1 [fw=weight]
mat m[4,6] = round(r(mean),.0004)
*urban
su unemployed if age_1524==1 & b1p05==1 & lab_force==1 [fw=weight]
mat m[5,4] = round(r(mean),.0004)
su unemployed if age_1524==1 & jk==1 & b1p05==1 & lab_force==1 [fw=weight]
mat m[5,5] = round(r(mean),.0004)
su unemployed if age_1524==1 & jk==2 & b1p05==1 & lab_force==1 [fw=weight]
mat m[5,6] = round(r(mean),.0004)
*rural
su unemployed if age_1524==1 & b1p05==2 & lab_force==1 [fw=weight]
mat m[6,4] = round(r(mean),.0004)
su unemployed if age_1524==1 & jk==1 & b1p05==2 & lab_force==1 [fw=weight]
mat m[6,5] = round(r(mean),.0004)
su unemployed if age_1524==1 & jk==2 & b1p05==2 & lab_force==1 [fw=weight]
mat m[6,6] = round(r(mean),.0004)

*labor force participation rate of population 15+
*total
su lab_force if age_15plus==1 [fw=weight]
mat m[7,1] = round(r(mean),.0004)
su lab_force if age_15plus==1 & jk==1 [fw=weight]
mat m[7,2] = round(r(mean),.0004)
su lab_force if age_15plus==1 & jk==2 [fw=weight]
mat m[7,3] = round(r(mean),.0004)
*urban
su lab_force if age_15plus==1 & b1p05==1 [fw=weight]
mat m[8,1] = round(r(mean),.0004)
su lab_force if age_15plus==1 & jk==1 & b1p05==1 [fw=weight]
mat m[8,2] = round(r(mean),.0004)
su lab_force if age_15plus==1 & jk==2 & b1p05==1 [fw=weight]
mat m[8,3] = round(r(mean),.0004)
*rural
su lab_force if age_15plus==1 & b1p05==2 [fw=weight]
mat m[9,1] = round(r(mean),.0004)
su lab_force if age_15plus==1 & jk==1 & b1p05==2 [fw=weight]
mat m[9,2] = round(r(mean),.0004)
su lab_force if age_15plus==1 & jk==2 & b1p05==2 [fw=weight]
mat m[9,3] = round(r(mean),.0004)

*labor force participation rate of population 15-24
*total
su lab_force if age_1524==1 [fw=weight]
mat m[7,4] = round(r(mean),.0004)
su lab_force if age_1524==1 & jk==1 [fw=weight]
mat m[7,5] = round(r(mean),.0004)
su lab_force if age_1524==1 & jk==2 [fw=weight]
mat m[7,6] = round(r(mean),.0004)
*urban
su lab_force if age_1524==1 & b1p05==1 [fw=weight]
mat m[8,4] = round(r(mean),.0004)
su lab_force if age_1524==1 & jk==1 & b1p05==1 [fw=weight]
mat m[8,5] = round(r(mean),.0004)
su lab_force if age_1524==1 & jk==2 & b1p05==1 [fw=weight]
mat m[8,6] = round(r(mean),.0004)
*rural
su lab_force if age_1524==1 & b1p05==2 [fw=weight]
mat m[9,4] = round(r(mean),.0004)
su lab_force if age_1524==1 & jk==1 & b1p05==2 [fw=weight]
mat m[9,5] = round(r(mean),.0004)
su lab_force if age_1524==1 & jk==2 & b1p05==2 [fw=weight]
mat m[9,6] = round(r(mean),.0004)

*informal employment rate of population 15+
*total
su employed_inf if age_15plus==1 & employed==1 [fw=weight]
mat m[10,1] = round(r(mean),.0004)
su employed_inf if age_15plus==1 & jk==1 & employed==1 [fw=weight]
mat m[10,2] = round(r(mean),.0004)
su employed_inf if age_15plus==1 & jk==2 & employed==1 [fw=weight]
mat m[10,3] = round(r(mean),.0004)
*urban
su employed_inf if age_15plus==1 & b1p05==1 & employed==1 [fw=weight]
mat m[11,1] = round(r(mean),.0004)
su employed_inf if age_15plus==1 & jk==1 & b1p05==1 & employed==1 [fw=weight]
mat m[11,2] = round(r(mean),.0004)
su employed_inf if age_15plus==1 & jk==2 & b1p05==1 & employed==1 [fw=weight]
mat m[11,3] = round(r(mean),.0004)
*rural
su employed_inf if age_15plus==1 & b1p05==2 & employed==1  [fw=weight]
mat m[12,1] = round(r(mean),.0004)
su employed_inf if age_15plus==1 & jk==1 & b1p05==2 & employed==1 [fw=weight]
mat m[12,2] = round(r(mean),.0004)
su employed_inf if age_15plus==1 & jk==2 & b1p05==2 & employed==1 [fw=weight]
mat m[12,3] = round(r(mean),.0004)
*informal employment rate of population 15-24
*total
su employed_inf if age_1524==1 & employed==1 [fw=weight]
mat m[10,4] = round(r(mean),.0004)
su employed_inf if age_1524==1 & jk==1 & employed==1 [fw=weight]
mat m[10,5] = round(r(mean),.0004)
su employed_inf if age_1524==1 & jk==2 & employed==1 [fw=weight]
mat m[10,6] = round(r(mean),.0004)
*urban
su employed_inf if age_1524==1 & b1p05==1 & employed==1 [fw=weight]
mat m[11,4] = round(r(mean),.0004)
su employed_inf if age_1524==1 & jk==1 & b1p05==1 & employed==1 [fw=weight]
mat m[11,5] = round(r(mean),.0004)
su employed_inf if age_1524==1 & jk==2 & b1p05==1 & employed==1 [fw=weight]
mat m[11,6] = round(r(mean),.0004)
*rural
su employed_inf if age_1524==1 & b1p05==2 & employed==1 [fw=weight]
mat m[12,4] = round(r(mean),.0004)
su employed_inf if age_1524==1 & jk==1 & b1p05==2 & employed==1 [fw=weight]
mat m[12,5] = round(r(mean),.0004)
su employed_inf if age_1524==1 & jk==2 & b1p05==2 & employed==1 [fw=weight]
mat m[12,6] = round(r(mean),.0004)

mat colnames m = "Total Pop 15+" "Men Pop 15+" "Women Pop 15+" "Total Youth 15-24" "Men Youth 15-24" "Women Youth 15-24"
mat rownames m = "Employment Rate (Total)" "Urban" "Rural" "Unemployment Rate (Total)" "Urban" "Rural" "Labor Force Rate (Total)" "Urban" "Rural" "Informal Employment Rate (Total)" "Urban" "Rural"
mat2txt, matrix(m) saving("$dirwork\q1_2001.xls") replace


**2011 sakernas**
insheet using "$dirwork\sakernas11aug.csv",clear

*age
g age_15plus=umur>=15
g age_1524=inrange(umur,15,24)

*employed status
/*if respondent worked during the previous week OR
had a job but temporarily not working during the previous week */

g employed=b5p2a1==1 | b5p3==1 
g employed_inf=employed==1 & inlist(b5p12,1,5,6,7)


*unemployed status
/*if respondent does not have a job but is still actively looking for a job
OR establishing a new business
OR have given up hope of finding a job 
OR have a future job arranged (have a job but has not started it yet) */

g unemployed=b5p4==1 | b5p5==1 | inlist(b5p6,1,2)
replace unemployed=0 if employed==1

*laborforce status
g lab_force=employed==1 | unemployed==1

*Set output
local j_rows=12
local k_columns=6
mat m = J(`j_rows',`k_columns',.)


*employment rate of population 15+
*total
su employed if age_15plus==1 [fw=weightbc]
mat m[1,1] = round(r(mean),.0004)
su employed if age_15plus==1 & jk==1 [fw=weightbc]
mat m[1,2] = round(r(mean),.0004)
su employed if age_15plus==1 & jk==2 [fw=weightbc]
mat m[1,3] = round(r(mean),.0004)
*urban
su employed if age_15plus==1 & b1p05==1 [fw=weightbc]
mat m[2,1] = round(r(mean),.0004)
su employed if age_15plus==1 & jk==1 & b1p05==1 [fw=weightbc]
mat m[2,2] = round(r(mean),.0004)
su employed if age_15plus==1 & jk==2 & b1p05==1 [fw=weightbc]
mat m[2,3] = round(r(mean),.0004)
*rural
su employed if age_15plus==1 & b1p05==2 [fw=weightbc]
mat m[3,1] = round(r(mean),.0004)
su employed if age_15plus==1 & jk==1 & b1p05==2 [fw=weightbc]
mat m[3,2] = round(r(mean),.0004)
su employed if age_15plus==1 & jk==2 & b1p05==2 [fw=weightbc]
mat m[3,3] = round(r(mean),.0004)

*employment rate of population 15-24
*total
su employed if age_1524==1 [fw=weightbc]
mat m[1,4] = round(r(mean),.0004)
su employed if age_1524==1 & jk==1 [fw=weightbc]
mat m[1,5] = round(r(mean),.0004)
su employed if age_1524==1 & jk==2 [fw=weightbc]
mat m[1,6] = round(r(mean),.0004)
*urban
su employed if age_1524==1 & b1p05==1 [fw=weightbc]
mat m[2,4] = round(r(mean),.0004)
su employed if age_1524==1 & jk==1 & b1p05==1 [fw=weightbc]
mat m[2,5] = round(r(mean),.0004)
su employed if age_1524==1 & jk==2 & b1p05==1 [fw=weightbc]
mat m[2,6] = round(r(mean),.0004)
*rural
su employed if age_1524==1 & b1p05==2 [fw=weightbc]
mat m[3,4] = round(r(mean),.0004)
su employed if age_1524==1 & jk==1 & b1p05==2 [fw=weightbc]
mat m[3,5] = round(r(mean),.0004)
su employed if age_1524==1 & jk==2 & b1p05==2 [fw=weightbc]
mat m[3,6] = round(r(mean),.0004)

*unemployment rate of population 15+
*total
su unemployed if age_15plus==1 & lab_force==1 [fw=weightbc]
mat m[4,1] = round(r(mean),.0004)
su unemployed if age_15plus==1 & jk==1 & lab_force==1 [fw=weightbc]
mat m[4,2] = round(r(mean),.0004)
su unemployed if age_15plus==1 & jk==2 & lab_force==1 [fw=weightbc]
mat m[4,3] = round(r(mean),.0004)
*urban
su unemployed if age_15plus==1 & b1p05==1 & lab_force==1 [fw=weightbc]
mat m[5,1] = round(r(mean),.0004)
su unemployed if age_15plus==1 & jk==1 & b1p05==1 & lab_force==1 [fw=weightbc]
mat m[5,2] = round(r(mean),.0004)
su unemployed if age_15plus==1 & jk==2 & b1p05==1 & lab_force==1 [fw=weightbc]
mat m[5,3] = round(r(mean),.0004)
*rural
su unemployed if age_15plus==1 & b1p05==2 & lab_force==1  [fw=weightbc]
mat m[6,1] = round(r(mean),.0004)
su unemployed if age_15plus==1 & jk==1 & b1p05==2 & lab_force==1 [fw=weightbc]
mat m[6,2] = round(r(mean),.0004)
su unemployed if age_15plus==1 & jk==2 & b1p05==2 & lab_force==1 [fw=weightbc]
mat m[6,3] = round(r(mean),.0004)

*unemployment rate of population 15-24
*total
su unemployed if age_1524==1 & lab_force==1 [fw=weightbc]
mat m[4,4] = round(r(mean),.0004)
su unemployed if age_1524==1 & jk==1 & lab_force==1 [fw=weightbc]
mat m[4,5] = round(r(mean),.0004)
su unemployed if age_1524==1 & jk==2 & lab_force==1 [fw=weightbc]
mat m[4,6] = round(r(mean),.0004)
*urban
su unemployed if age_1524==1 & b1p05==1 & lab_force==1 [fw=weightbc]
mat m[5,4] = round(r(mean),.0004)
su unemployed if age_1524==1 & jk==1 & b1p05==1 & lab_force==1 [fw=weightbc]
mat m[5,5] = round(r(mean),.0004)
su unemployed if age_1524==1 & jk==2 & b1p05==1 & lab_force==1 [fw=weightbc]
mat m[5,6] = round(r(mean),.0004)
*rural
su unemployed if age_1524==1 & b1p05==2 & lab_force==1 [fw=weightbc]
mat m[6,4] = round(r(mean),.0004)
su unemployed if age_1524==1 & jk==1 & b1p05==2 & lab_force==1 [fw=weightbc]
mat m[6,5] = round(r(mean),.0004)
su unemployed if age_1524==1 & jk==2 & b1p05==2 & lab_force==1 [fw=weightbc]
mat m[6,6] = round(r(mean),.0004)

*labor force participation rate of population 15+
*total
su lab_force if age_15plus==1 [fw=weightbc]
mat m[7,1] = round(r(mean),.0004)
su lab_force if age_15plus==1 & jk==1 [fw=weightbc]
mat m[7,2] = round(r(mean),.0004)
su lab_force if age_15plus==1 & jk==2 [fw=weightbc]
mat m[7,3] = round(r(mean),.0004)
*urban
su lab_force if age_15plus==1 & b1p05==1 [fw=weightbc]
mat m[8,1] = round(r(mean),.0004)
su lab_force if age_15plus==1 & jk==1 & b1p05==1 [fw=weightbc]
mat m[8,2] = round(r(mean),.0004)
su lab_force if age_15plus==1 & jk==2 & b1p05==1 [fw=weightbc]
mat m[8,3] = round(r(mean),.0004)
*rural
su lab_force if age_15plus==1 & b1p05==2 [fw=weightbc]
mat m[9,1] = round(r(mean),.0004)
su lab_force if age_15plus==1 & jk==1 & b1p05==2 [fw=weightbc]
mat m[9,2] = round(r(mean),.0004)
su lab_force if age_15plus==1 & jk==2 & b1p05==2 [fw=weightbc]
mat m[9,3] = round(r(mean),.0004)

*labor force participation rate of population 15-24
*total
su lab_force if age_1524==1 [fw=weightbc]
mat m[7,4] = round(r(mean),.0004)
su lab_force if age_1524==1 & jk==1 [fw=weightbc]
mat m[7,5] = round(r(mean),.0004)
su lab_force if age_1524==1 & jk==2 [fw=weightbc]
mat m[7,6] = round(r(mean),.0004)
*urban
su lab_force if age_1524==1 & b1p05==1 [fw=weightbc]
mat m[8,4] = round(r(mean),.0004)
su lab_force if age_1524==1 & jk==1 & b1p05==1 [fw=weightbc]
mat m[8,5] = round(r(mean),.0004)
su lab_force if age_1524==1 & jk==2 & b1p05==1 [fw=weightbc]
mat m[8,6] = round(r(mean),.0004)
*rural
su lab_force if age_1524==1 & b1p05==2 [fw=weightbc]
mat m[9,4] = round(r(mean),.0004)
su lab_force if age_1524==1 & jk==1 & b1p05==2 [fw=weightbc]
mat m[9,5] = round(r(mean),.0004)
su lab_force if age_1524==1 & jk==2 & b1p05==2 [fw=weightbc]
mat m[9,6] = round(r(mean),.0004)

*informal employment rate of population 15+
*total
su employed_inf if age_15plus==1 & employed==1 [fw=weightbc]
mat m[10,1] = round(r(mean),.0004)
su employed_inf if age_15plus==1 & jk==1 & employed==1 [fw=weightbc]
mat m[10,2] = round(r(mean),.0004)
su employed_inf if age_15plus==1 & jk==2 & employed==1 [fw=weightbc]
mat m[10,3] = round(r(mean),.0004)
*urban
su employed_inf if age_15plus==1 & b1p05==1 & employed==1 [fw=weightbc]
mat m[11,1] = round(r(mean),.0004)
su employed_inf if age_15plus==1 & jk==1 & b1p05==1 & employed==1 [fw=weightbc]
mat m[11,2] = round(r(mean),.0004)
su employed_inf if age_15plus==1 & jk==2 & b1p05==1 & employed==1 [fw=weightbc]
mat m[11,3] = round(r(mean),.0004)
*rural
su employed_inf if age_15plus==1 & b1p05==2 & employed==1  [fw=weightbc]
mat m[12,1] = round(r(mean),.0004)
su employed_inf if age_15plus==1 & jk==1 & b1p05==2 & employed==1 [fw=weightbc]
mat m[12,2] = round(r(mean),.0004)
su employed_inf if age_15plus==1 & jk==2 & b1p05==2 & employed==1 [fw=weightbc]
mat m[12,3] = round(r(mean),.0004)
*informal employment rate of population 15-24
*total
su employed_inf if age_1524==1 & employed==1 [fw=weightbc]
mat m[10,4] = round(r(mean),.0004)
su employed_inf if age_1524==1 & jk==1 & employed==1 [fw=weightbc]
mat m[10,5] = round(r(mean),.0004)
su employed_inf if age_1524==1 & jk==2 & employed==1 [fw=weightbc]
mat m[10,6] = round(r(mean),.0004)
*urban
su employed_inf if age_1524==1 & b1p05==1 & employed==1 [fw=weightbc]
mat m[11,4] = round(r(mean),.0004)
su employed_inf if age_1524==1 & jk==1 & b1p05==1 & employed==1 [fw=weightbc]
mat m[11,5] = round(r(mean),.0004)
su employed_inf if age_1524==1 & jk==2 & b1p05==1 & employed==1 [fw=weightbc]
mat m[11,6] = round(r(mean),.0004)
*rural
su employed_inf if age_1524==1 & b1p05==2 & employed==1 [fw=weightbc]
mat m[12,4] = round(r(mean),.0004)
su employed_inf if age_1524==1 & jk==1 & b1p05==2 & employed==1 [fw=weightbc]
mat m[12,5] = round(r(mean),.0004)
su employed_inf if age_1524==1 & jk==2 & b1p05==2 & employed==1 [fw=weightbc]
mat m[12,6] = round(r(mean),.0004)

mat colnames m = "Total Pop 15+" "Men Pop 15+" "Women Pop 15+" "Total Youth 15-24" "Men Youth 15-24" "Women Youth 15-24"
mat rownames m = "Employment Rate (Total)" "Urban" "Rural" "Unemployment Rate (Total)" "Urban" "Rural" "Labor Force Rate (Total)" "Urban" "Rural" "Informal Employment Rate (Total)" "Urban" "Rural"
mat2txt, matrix(m) saving("$dirwork\q1_2011.xls") replace

log close
