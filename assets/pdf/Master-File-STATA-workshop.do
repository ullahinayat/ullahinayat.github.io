
********** STATA Workshop

********** Inayat Ullah

* why stata: https://youtu.be/uIo-SInPTqQ

* http://stats.idre.ucla.edu/stata/

* results window
* command window
* variables window
* properties window (variables, data)
* review(history) window

* menus



********** basic setup

* display the path of the current working directory
pwd

* change directory (home)
cd

* change directory (in quotes " ")
cd C:\Users\KIDS\Desktop\w

cd "C:\Users\KIDS\Desktop\w"

pwd

* clear the results window
cls

* clear memory
clear all

* not to pause the more message
set more off



********** do-file

* doedit: open do-file editor
doedit

* Stata do-files are text files where users can store and run their commands for reuse, rather than retyping the commands into the Command window
* The file extension .do is used for do-files

* The do-file editor colors Stata commands blue
* Comments, which are not executed, are usually preceded by * and are colored green
* Words in quotes (file names, string values) are colored "red"

* To run a command from the do-file, highlight part or all of the command, and then hit Ctrl+D (Mac: Shift+Cmd+D)

* To save the do-file, hit Ctrl-S (Mac: Cmd+S) or click "Save" icon on the right top.

* Use dataset from Stata website
webuse auto, clear

* comments are not executed

/* this kind of comment 
   can span
   multiple lines */
   
* use /// to continue a command over multiple lines
summarize weight length

summarize weight ///
  length




********** importing(exporting) data 

* use				load Stata dataset

* save				save Stata dataset

* import excel		import Excel dataset

* import delimited	import delimited data (csv)

* Data files stored in Stata's format are known as .dta files

* load dataset auto from Stata website
clear
webuse auto

webuse auto, clear

webuse "auto", clear

webuse "auto.dta", clear

* load dataset auto from Stata program
sysuse auto, clear

pwd

* save data, replace if it exists
save auto, replace

* creating a directory within existing directory
mkdir output

save output/auto, replace

* clear memory and load data
clear
use auto

use auto, clear

use auto.dta, clear

use "auto.dta", clear

pwd

* display files in the current working directory
dir

use "output/auto.dta", clear

* export excel data (xls)
export excel using auto, replace

* export delimted data (csv)
export delimited using auto, replace

* what's the difference? load them in excel

* save variable names to first row
export excel using auto0, replace firstrow(variables)

* import delimited data (csv)
import delimited using auto, clear
import delimited using auto.csv, clear
import delimited using "auto.csv", clear
import delimited using "C:\Users\KIDS\Desktop\w\auto.csv", clear

* import excel data (xls)
import excel using auto0, clear

* see variables. what happens?

* import excel data (xls) and treat first row of excel data as variable names
import excel using auto0, clear firstrow
import excel using auto0.xls, clear firstrow
import excel using "auto0.xlsx", clear firstrow
import excel using "C:\Users\KIDS\Desktop\w\auto0.xlsx", clear firstrow



********** exercise

* download a csv file (assignment1.csv) from ekdis and import it

* save STATA data (assignment1.dta)

* export EXCEL data (assignment1.xls) with variable names to first row

* clear

* import EXCEL data (assignment1.xls)



********** exercise answer

* download a csv file (assignment1.csv) from ekdis and import it

* method1. determine the path where you download it
import delimited using "assignment1.csv", clear

* method2. copy it to your current working directory
pwd
import delimited using "assignment1.csv", clear

* save data (assignment1.dta)
save assignment1, replace

* export EXCEL data (assignment1.xls) with variable names to first row
export excel using assignment1, replace firstrow(variables)

* import EXCEL data (assignment1.xls)
import excel using assignment1, clear firstrow


********** help COMMAND
* help COMMAND	open help page for COMMAND

* open help file for command summarize
help summarize

* bolded words are required
* [bracketed] words are optional
* the underlined part of the command name is the minimal abbreviation of the command required for Stata to understand it
* we can use su for summarize

summarize
summ
sum
su

* open help file for command use
help use
* we can use u for use
u auto, clear

* open help file for command help
help help
* we can use h for command help
h su



********** viewing data

* describe	describe data

* browse	open spreadsheet of data

* list		print data to Stata console

* load data hs0 from the website
use "https://stats.idre.ucla.edu/stat/data/hs0.dta", clear

* save data hs0, replace
save hs0, replace

* describe data
describe
des
d

* browse data
browse
bro
br

* black: numeric
* red: strings
* blue: numeric with string labels

* list all values of variables
list
li
l

l in 1/10

* list read and write for first 5 observations
l read write in 1/5

* with clean output
l read write in 1/10, clean

l read write in 1/10, sep(0)    // Row Lines

l read write in 1/10


********** selecting by condition with if

l gender ses math

* list gender, ses, and math if math > 70
l gender ses math if math > 70

* list gender, ses, and read for females (gender=2) who have read > 70
l gender ses read if gender == 2 & read > 70

l gender ses math if math > 70 & ses < 3

* greater than: >
* greater than or equal to: >=
* less than: <
* less than or equal to: <=
* and: &
* or: |
* not equal: ~=
* not equal: !=

* list gender, read, and prgtype for males (gender=1) in academic program (prgtype=academic) with clean output

l gender read prgtype if gender == 1 & prgtype == "academic", clean



********** exercise

* list gender, read, and math if math < 40 or read < 40

* list gender, read, and math if females (gender=2) who have math < 40 or read < 40

* list gender, read, math, and prgtype if males (gender=1) not in academic program (prgtype~=academic) who have read >= 55 and math >= 45





********** exercise answer

* list gender, read, and math if math < 40 or read < 40
list gender read math if math < 40 | read < 40

* list gender, read, and math if females (gender=2) who have math < 40 or read < 40
l gender read math if gender == 2 & (math < 40 | read < 40)

* list gender, read, math, and prgtype if males (gender=1) not in academic program (prgtype~=academic) who have read >= 55 and math >= 45
l gender read math prgtype if gender == 1 & prgtype ~= "academic" & read >= 55 & math >= 45



********** exploring data

* codebook		inspect variable values

* summarize		summarize distribution

* tabulate		tabulate frequencies

* inspect values of all variables
codebook

* inspect values of variables: read gender and prgtype 

codebook prgtype

codebook read gender prgtype

* summarize all variables
summarize

* summarize read and math
sum read math

* summarize read and math for females (gender=2)
sum read math if gender == 2

* detailed summary of read and math for females
sum read math if gender == 2, detail

* list ses
l ses

* summarize ses
sum ses

* tabulate frequencies of ses
tabulate ses

tab ses

* use the nolabel option to display the underlying numeric values for a variable with labeled values
tab ses, nolabel

* install fre package
ssc install fre

* use fre to tabulate ses
fre ses

* list prgtype
l prgtype

* summarize prgtype
sum prgtype

* tabulate prgtype
tab prgtype

* two-way tabulations
* tabulate ses gender
tab ses gender

* tabulate ses gender with row percentage
tab ses gender, row

* tabulate ses gender with column percentage
tab ses gender, col

* tabulate ses in descending order of frequency

tab ses

tab ses, sort

* summarize math by ses
tab ses, sum(math)

sum math if ses==1
sum math if ses==2
sum math if ses==3

bysort ses: sum math

********** exercise

* tabulate race in descending order of frequency

* tabulate race and determine the numeric code for "asian" and the numerice code for "white"

* summarize read write and math for asian

* summarize read write and math for white

* summarize math by race using tabulate command

* tabulate ses prgtype for white

* tabulate ses prgtype for white females who have math > 50

* summarize read by prgtype for white





********** exercise answer

* tabulate race in descending order of frequency
tab race, sort

* tabulate race and determine the numeric code for "asian" and the numerice code for "white"
tab race
tab race, nolabel
fre race
ssc install fre
codebook race

* summarize read write and math for asian
sum read write math if race == 2

* summarize read write and math for white
sum read write math if race == 4

* summarize math by race using tabulate command
tab race, sum(math)

* tabulate ses prgtype for white
tab ses prgtype if race == 4

* tabulate ses prgtype for white females who have math > 50
tab ses prgtype if race == 4 & gender == 2 & math > 50

* summarize read by prgtype for white
tab prgtype if race == 4, sum(read)



********** data management

* generate		create variable

* replace		replace values of variable

* egen			extended variable generation

* rename		rename variable

* recode		recode variable values

* label variable	give variable description

* label define	generate value label set

* label value	apply value labels to variable

* encode		convert string variable to numeric

* decode		convert numeric variable to string

* generate a sum of 3 variables: math science socst
generate total = math + science + socst
gen total = math + science + socst

* 5 missing values were generated
* summarize 3 variables and a new variable
summarize total math science socst

* list 4 variables when science is missing
l total math science socst if science == .
l total math science socst if missing(science)

* replace total with (math+socst) if science is missing
replace total = math + socst if missing(science)

* list 4 variables when science is missing
l total math science socst if missing(science)

* summarize 4 variables
summarize total math science socst

* extended generate (egen) a total of 3 variables: math science socst
egen total0 = rowtotal(math science socst)

* summarize total total0
sum total total0
sum total*

* generate a mean of (all non-missing of) 3 variables: math science socst
gen mean = (math + science + socst) / 3

* extended generate (egen) a mean of 3 variables: math science socst
egen mean0 = rowmean(math science socst)

* summarize mean mean0
sum mean mean0
sum mean*

* replace mean with (math+socst)/2 if science is missing
replace mean = (math + socst) / 2 if missing(science)

* summarize mean mean0
sum mean*

* help egen
help egen



********** exercise

* generate a variable: ftotal to sum (all non-missing of) 4 variables: read write math science

* replace ftotal with a sum of 3 variables (read + write + math) if science is missing

* egen ftotal0 to sum 4 variables: read write math science

* summarize ftotal ftotal0

* generate a variable: fmean to average (all non-missing of) 4 variables: read write math science

* replace fmean with a mean of 3 variables (read + write + math)/3 if science is missing

* egen fmean0 to average 4 variables: read write math science

* summarize fmean fmean0





********** exercise answer

* generate a variable: ftotal to sum (all non-missing of) 4 variables: read write math science
gen ftotal = read + write + math + science

* replace ftotal with a sum of 3 variables (read + write + math) if science is missing
replace ftotal = read + write + math if missing(science)

* egen ftotal0 to sum 4 variables: read write math science
egen ftotal0 = rowtotal(read write math science)

* summarize ftotal ftotal0
sum ftotal*

* generate a variable: fmean to average (all non-missing of) 4 variables: read write math science
gen fmean = (read + write + math + science)/4

* replace ftotal with a mean of 3 variables (read + write + math)/3 if science is missing
replace fmean = (read + write + math)/3 if missing(science)

* egen fmean0 to average 4 variables: read write math science
egen fmean0 = rowmean(read write math science)

* summarize fmean fmean0
sum fmean*



**********  renaming and recoding variables

tab gender

* rename OLD NEW
* renaming gender to female
rename gender female

* tabulate female
tab female

* recode VARIABLE (OLD=NEW)(OLD=NEW)
* recoding female 1 to 0 and female 2 to 1 (=> male = 0, female = 1)
recode female (1=0)(2=1)

* tabulate female
tab female



**********  labeling

* describe data and see value label and variable label
des

* list labels
label list

* tabulate ses
tab ses

* label a variable ses
label variable ses "socioeconomic status"

* tabulate ses
tab ses

* tabulate schtyp
tab schtyp

* label a variable schtyp
label variable schtyp "public/private school"

* create a label pubpri
label define pubpri 1 "public" 2 "private"

label list

tab schtyp

* apply a label pubpri for schtyp
label values schtyp pubpri

* tabulate schtyp
tab schtyp

* tabulate schtyp with nolabel
tab schtyp, nolabel

* tabulate schtyp using fre
fre schtyp



********** exercise

* tabulate female

* label female "female"

* create a label female1 (0 "male" 1 "female")

* apply a label female1 for female

* tabulate female

* tabulate race

* codebook race

* create a label racelab 1 "hispanic" 2 "asian" 3 "black" 4 "white" 5 "etc"

* apply a label racelab for race

* tabulate race





********** exercise answer

tab gender

gen female = gender==2

tab gender female

* tabulate female
tab female

* label female "female"
label variable female "female"

* create a label female1 (0 "male" 1 "female")
label define female1 0 "male" 1 "female"

* apply a label female1 for female
label values female female1

* tabulate female
tab female

* tabulate race
tab race

* codebook race
codebook race

* create a label racelab 1 "hispanic" 2 "asian" 3 "black" 4 "white" 5 "etc"
label define racelab 1 "hispanic" 2 "asian" 3 "black" 4 "white" 5 "etc"

* apply a label racelab for race
label values race racelab

* tabulate race
tab race

* codebook race
codebook race



********** encoding a string variable into numeric
********** decoding a numeric variable into string

* tabulate prgtype
tab prgtype

* encoding string prgtype into numeric variable prog
encode prgtype, gen(prog)

* tabulate prog
tab prog

* browse prog prgtype to see that prog is a numeric with labels (blue) and prgtype is string (red)
browse prog prgtype

* codebook prgtype prog
codebook prgtype prog

* tabulate race
tab race

* decoding numeric race into string variable racestr
decode race, gen(racestr)

* tabulate racestr
tab racestr

* browse race racestr
browse race*

* codebook race racestr
codebook race*

* summarize read math for white
sum read math if race == 4
sum read math if racestr == "white"

* summarize read math for asian
sum read math if race == 2
sum read math if racestr == "asian"



********** exercise

* create a variable highmath that takes 1 if math > 60 and 0 otherwise using generate and replace commands

* tabulate highmath

* summarize math by highmath

* label highmath "high math score (> 60)"

* create a label mathlab 0 "low" 1 "high"

* apply mathlab for highmath

* tabulate highmath

* create a variable white that takes 1 if racestr = white and 0 otherwise

* tabulate race white

* summarize science in details and determine a median

* create a variable highscience that takes 1 if median or above and 0 otherwise

* tabulate highscience





********** exercise answer

* create a variable highmath that takes 1 if math > 60 and 0 otherwise using generate and replace commands
gen highmath = .
replace highmath = 1 if math > 60
replace highmath = 0 if math <= 60

tab math highmath

gen highmath0 = (math > 60)

tab highmath

tab highmath0

sum highmath*

* tabulate highmath
tab highmath

* summarize math by highmath
tab highmath, sum(math)

sum math if highmath == 0
sum math if highmath == 1

* label highmath "high math score (> 60)"
label variable highmath "high math score (> 60)"

* create a label mathlab 0 "low" 1 "high"
label define mathlab 0 "low" 1 "high"

* apply mathlab for highmath
label values highmath mathlab

* tabulate highmath
tab highmath

* create a variable white that takes 1 if racestr = white and 0 otherwise
gen white = .
replace white = 1 if racestr == "white"
replace white = 0 if racestr ~= "white"

gen white0 = racestr == "white"

gen white1 = race == 4

sum white*

* tabulate race white
tab race white

* summarize science in details and determine a median
sum science, detail

codebook science

* create a variable highscience that takes 1 if median or above and 0 otherwise
gen highscience = .
replace highscience = 1 if science >= 53
replace highscience = 0 if science < 53

gen highscience0 = science >= 53

sum highscience*

* WRONG highscience highscience0 b/c missing values
replace highscience = . if missing(science)

replace highscience0 = . if missing(science)

gen highscience1 = science >= 53 if ~missing(science)

sum highscience*

* tabulate highscience
tab highscience



********** dataset operations

* keep		keep variables, drop others

* drop		drop variables, keep others

* keep if	keep observations, drop others

* drop if	drop observations, keep others

* sort		sort by variables, ascending

* gsort		ascending and descending sort

* load data hs0
use "https://stats.idre.ucla.edu/stat/data/hs0.dta", clear
use hs0, clear

* keep gender id race ses schtyp prgtype read math
keep gender id race ses schtyp prgtype read math

* drop schtyp prgtype
drop schtyp prgtype

tab gender

* keep if females (gender=2)
keep if gender == 2

tab gender

* summarize gender
sum gender

su math
* keep if math > 50
keep if math > 50

* summarize math
sum math

* load data hs0
use hs0, clear

* drop if male or math <= 50 
drop if gender == 1 | math <= 50

* summarize math
sum math

* load data hs0
use hs0, clear

* keep if female and math > 50 
keep if gender == 2 & math > 50

* summarize math
sum math

* load data hs0
use hs0, clear

* list in first 10 observations
l id in 1/10

* sort id (decending)
sort id

* list in first 10 observations
l id in 1/10

* sort id (ascending)
gsort -id

* list in first 10 observations
l id in 1/10

* sort math science (decending)
sort math science

* list in first 10 observations
l math science in 1/10

* sort math (ascending) science (decending)
gsort -math science

* list in first 10 observations
l in 1/10

* order variables in dataset
order id, first



********** record your work

* open a log file to keep a record of your work and save it
log using test.txt, text replace

* check where your working directory
pwd

* load data hs0
use hs0, clear

* summarize science in details
sum science, d

* tabulate ses
tab ses

* close a log file to save it
log close



********** exercise

* open a log file test.txt

* load data hs0

* summarize math in details and determine a median

* keep if math is a median or above

* save data hs0_highmath

* load data hs0

* keep if math is below a median

* save data hs0_lowmath

* load data hs0

* keep variables: id write

* save data hs0_write

* close a log file





********** exercise answer

* open a log file test.txt
log using test.txt, text replace

* load data hs0
use hs0, clear

* summarize math in details and determine a median
sum math, d

* keep if math is a median or above
keep if math >= 52

* save data hs0_highmath
save hs0_highmath, replace

* load data hs0
use hs0, clear

* keep if math is below a median
keep if math < 52

* save data hs0_lowmath
save hs0_lowmath, replace

* load data hs0
use hs0, clear

* keep id write
keep id write

* save data hs0_write
save hs0_write, replace

* close the log file
log close



********** assignment 1

* upload your log file assignment1.txt on ekdis

* download a csv file (assignment1.csv) from ekdis

* open a log file assignment1.txt

* repeat all exercises and run commands

* import assignment1.csv

* order variable id to first

* label id "unique id"

* rename gender to male and record male = 1 and female = 0

* label a variable male "gender: male"

* create a label male1 0 "female" 1 "male"

* apply a label male1 for a variable male

* tabulate male

* create a variable white that takes 1 if race = white and 0 otherwise

* drop race

* order white after male

* label a variable white "race: white"

* create a label white1 0 "non-white" 1 "white"

* apply a label white1 for a variable white

* tabulate white

* replace ses in numeric variable with a label of 1=low 2=middle 3=high
* (create ses0, drop ses, and rename ses0 ses)

* label a variable ses "socioeconomic status"

* order ses after white

* rename schtyp to private

* recode private=0 (schtyp=1) and private=1 (schtyp = 2)

* create a label private1 0 "non-private" 1 "private"

* apply a label private1 for a variable private

* label a variable private "private school"

* replace prgtype "vocati" to "vocational"

* encode prgtype to prgtype0

* drop prgtype, rename prgtype0 to prgtype, and order it after private

* label a variable prgtype "program type"

* label a variable read "reading score"

* label a variable write "writing score"

* label a variable math "math score"

* label a variable science "science score"

* label a variable socst "social studies score"

* save data assignment1_clean, replace

* load data assignment1_clean

* keep if male

* save data assignment1_male, replace

* load data assignment1_clean

* keep if female

* save data assignment1_female, replace

* load data assignment1_clean

* summarize 5 test scores: read write math science socst

* create a variable total to sum them using egen

* create a variable mean to average them using egen

* create a variable max to determine max of them using egen

* create a variable min to determine min of them using egen

* create a variable mathmax to indicate if math score is a max score out of 5 test scores

* create a variable readmin to indicate if read score is a min score out of 5 test scores

* tabulate mathmax readmin

* how many students have a max math but a min read
* answer:

* summarize total mean for white males

* summarize total mean for non-white females

* which group has a higher score?
* answer:

* summarize mean by private using tabulate

* which school type has a higher score?
* answer:

* summarize mean by private ses using tabulate

* which school type and socioeconomic status have the highest score? what's the score?
* answer:

* which school type and socioeconomic status have the lowest score? what's the score?
* answer:

* close a log file




********** assignment 1 answer

* download a csv file (assignment1.csv) from ekdis

* open a log file assignment1.txt
log using assignment1.txt, text replace

* repeat all exercises and run commands

* import assignment1.csv
import delimited using assignment1, clear

* order variable id to first
order id, first

* label id "unique id"
label variable id "unique id"

* rename gender to male and record male = 1 and female = 0
* gender 1: male, 2: female
rename gender male
recode male (2=0)
replace male = 0 if male == 2

* label a variable male "gender: male"
label variable male "gender: male"

* create a label male1 0 "female" 1 "male"
label define male1 0 "female" 1 "male"

* apply a label male1 for a variable male
label values male male1

* tabulate male
tab male

* create a variable white that takes 1 if race = white and 0 otherwise

gen white = race == "white"

* drop race
drop race

* order white after male
order white, after(male)

* label a variable white "race: white"
label variable white "race: white"

* create a label white1 0 "non-white" 1 "white"
label define white1 0 "non-white" 1 "white"

* apply a label white1 for a variable white
label values white white1

* tabulate white
tab white

* replace ses in numeric variable with a label of 1=low 2=middle 3=high
* (create ses0, drop ses, and rename ses0 ses)
gen ses0 = .
replace ses0 = 1 if ses == "low"
replace ses0 = 2 if ses == "middle"
replace ses0 = 3 if ses == "high"

drop ses
rename ses0 ses

label define seslab 1 "low" 2 "middle" 3 "high"
label values ses seslab

* label a variable ses "socioeconomic status"
label variable ses "socioeconomic status"

* order ses after white
order ses, after(white)

* rename schtyp to private
rename schtyp private

* schtyp 1: public, 2: private

* recode private=0 (schtyp=1) and private=1 (schtyp = 2)
recode private (1=0)(2=1)

* create a label private1 0 "non-private" 1 "private"
label define private1 0 "non-private" 1 "private"

* apply a label private1 for a variable private
label values private private1

* label a variable private "private school"
label variable private "private school"

* replace prgtype "vocati" to "vocational"
replace prgtype = "vocational" if prgtype == "vocati"

* encode prgtype to prgtype0
encode prgtype, gen(prgtype0)

* drop prgtype, rename prgtype0 to prgtype, and order it after private
drop prgtype
rename prgtype0 prgtype
order prgtype, after(private)

* label a variable prgtype "program type"
label variable prgtype "program type"

* label a variable read "reading score"
label variable read "reading score"

* label a variable write "writing score"
label variable write "writing score"

* label a variable math "math score"
label variable math "math score"

* label a variable science "science score"
label variable science "science score"

* label a variable socst "social studies score"
label variable socst "social studies score"

* save data assignment1_clean, replace
save assignment1_clean, replace

* load data assignment1_clean
use assignment1_clean, clear

* keep if male
keep if male == 1

* save data assignment1_male, replace
save assignment1_male, replace

* load data assignment1_clean
use assignment1_clean, clear

* keep if female
keep if male == 0

* save data assignment1_female, replace
save assignment1_female, replace

* load data assignment1_clean
use assignment1_clean, clear

* summarize 5 test scores: read write math science socst
sum read write math science socst

* create a variable total to sum them using egen
egen total = rowtotal(read write math science socst)

* create a variable mean to average them using egen
egen mean = rowmean(read write math science socst)

* create a variable max to determine max of them using egen
egen max = rowmax(read write math science socst)

* create a variable min to determine min of them using egen
egen min = rowmin(read write math science socst)

* create a variable mathmax to indicate if math score is a max score out of 5 test scores
gen mathmax = math == max

* create a variable readmin to indicate if read score is a min score out of 5 test scores
gen readmin = read == min

* tabulate mathmax readmin
tab mathmax readmin

* how many students have a max math but a min read
* => 6

* summarize total mean for white males
sum total mean if white == 1 & male == 1

* summarize total mean for non-white females
sum total mean if white == 0 & male == 0

* which group has a higher score?
* => white males

* summarize mean by private using tabulate
tab private, sum(mean)

* which school type has a higher score?
* => private

* summarize mean by private ses using tabulate
tab private ses, sum(mean)

* which school type and socioeconomic status have the highest score? what's the score?
* => private + high: 62.4

* which school type and socioeconomic status have the lowest score? what's the score?
* => non-private + low: 46.7

* close the log file
log close



********************************************************************************
********************************Module II***************************************
********************************************************************************
**Topics
*Combining Datasets
*Collapsing Datasets
*Loops
*Graphs



********** combining datasets

* append	add more observations

* merge		add more variables, join by matching variable

* create hs0_male, a subsample of males
use hs0, clear

keep if gender == 1

save hs0_male, replace

* create hs0_female, a subsample of females
use hs0, clear

keep if gender == 2

save hs0_female, replace

* load data hs0
use hs0, replace

sum

* load data hs0_male
use hs0_male, replace

sum

* append hs0_female
append using hs0_female

sum

* load data hs0
use hs0, clear

* keep if females (gender=2)
keep if gender == 2

* keep id write
keep id write

sum

* save data hs0_write
save hs0_write, replace

* load data hs0
use hs0, clear

sort id

keep in 1/100

* drop write
drop write

sum

* merge in hs0_write using id to link by 1:1
merge 1:1 id using hs0_write

*original data set: 200 obs
* => hs0_write: female

*original data set: 200 obs
* => keep in 1/100

*master(current) file: 100 obs (40 males, 60 females)
*using file: female, hs0_write (109 females: 60 females id<=100, 49 females id>100)

* tabulate _merge
tab _merge

* browse
browse

* keep if matched or master only
keep if _merge == 1 | _merge == 3

* browse
browse

* keep if matched
keep if _merge == 3

* browse
browse

* drop _merge
drop _merge

* load data assignment1_clean
use hs0, clear

sort id

keep in 1/100

* drop write
drop write

* merge in hs0_write using id to link by 1:1 (match master and no generate _merge)
merge 1:1 id using hs0_write, keep(match master) nogen
help merge



********** collapsing data

* load data hs0
use hs0, clear

* collapse a mean of read math and a median of read math by socioeconomic status (ses)
collapse (mean) read math, by(ses)

list

* load data hs0
use hs0, clear

* collapse a median of read math by socioeconomic status (ses)
collapse (median) read_median=read math_median=math, by(ses)

list

* save data hs0_ses
save hs0_ses, replace

* load data hs0
use hs0, clear

* merge in hs0_ses using ses to link by m:1
merge m:1 ses using hs0_ses


********** exercise

* load data hs0

* collapse a median of write science, a min of write science, and a max of write science by race

* list

* save data hs0_race

* load data hs0

* merge in hs0_ses using ses to link by m:1

* create a variable write_high if writing score is greater than a median of writing score

* browse variables write*





********** exercise answer

* load data hs0
use hs0, clear
use "https://stats.idre.ucla.edu/stat/data/hs0.dta", clear

* collapse a median of write science, a min of write science, and a max of write science by race
collapse (median) write_median=write science_median=science (min) write_min=write science_min=science (max) write_max=write science_max=science, by(race)

* list
list

* save data hs0_race
save hs0_race, replace

* load data hs0
use hs0, clear

* merge in hs0_race using race to link by m:1
merge m:1 race using hs0_race

* create a variable write_high if writing score is greater than a median of writing score
gen write_high = write > write_median

* browse variables write*
browse write*



********** working across variables using forvalues foreach bysort 

* clear
clear

display 

local i = 50
local j = 150
local k = `i' + `j'

display "`i' + `j' = `k'"


* display numeric numbers from 1 to 10 using forvalues
forvalues i = 1 / 10 {
	display `j'
}

forvalues i = 1 / 10 {
	display "number: `i'"
}

* display string: white asian using foreach
foreach race in white asian hispanic {
	display "`race'"
}

* load data hs0
use hs0, clear

* codebook ses
codebook ses

* summarize read math by ses
tab ses, sum(read)
tab ses, sum(math)
sum read math if ses == 1
sum read math if ses == 2
sum read math if ses == 3

* summarize read math by ses using forvalues
forvalues i = 1 / 3 {
	display "ses: `i'"
	sum read math if ses == `i'
}

* summarize read math by ses using bysort
bysort ses: sum read math

* load data hs0
use hs0, clear

* create VARIABLE_high that takes 1 if VARIABLE > 60 and 0 otherwise for VARIABLE read write math science socst
gen read_high = read > 60
gen write_high = write > 60
gen math_high = math > 60
gen science_high = science > 60
gen socst_high = socst > 60

* replace science_high with missing values if science is missing
replace science_high = . if missing(science)

* summarize *_high read write math science socst
sum *_high read write math science socst

* load data hs0
use hs0, clear

* create VARIABLE_high that takes 1 if VARIABLE > 60 and 0 otherwise for VARIABLE read write math science socst using foreach
foreach v of var read write math science socst {
	display "`v'"
	gen `v'_high = `v' > 60 if ~missing(`v')
}

drop *_high

* summarize *_high read write math science socst
sum *_high read write math science socst




********** exercise

* load data hs0

* create `v'_low that takes 1 if `v' < 50 and 0 otherwise for `v': read write math science socst using foreach
* create VARIABLE_low that takes 1 if VARIABLE < 50 and 0 otherwise for VARIABLE: read write math science socst using foreach

* summarize *_low read write math science socst

* create race1 race2 race3 race4 race5 using forvalues: race1 takes 1 if race=1, race2 takes 1 if race=2, ...

* tabulate race race1

* tabulate race race2

* tabulate race race`i' using forvalues

* summarize read math by race using forvalues

* summarize read math by race using bysort





********** exercise answer

* load data hs0
use hs0, clear

* create `v'_low that takes 1 if `v' < 50 and 0 otherwise for `v': read write math science socst using foreach
foreach v of var read write math science socst {
	gen `v'_low = `v' < 50 if ~missing(`v')
}

* summarize *_low read write math science socst
sum *_low read write math science socst

* create race1 race2 race3 race4 race5 using forvalues: race1 takes 1 if race=1, race2 takes 1 if race=2, ...
forvalues i = 1 / 5 {
	gen race`i' = race == `i'
}

* tabulate race race1
tab race race1

* tabulate race race2
tab race race2

* tabulate race race`i' using forvalues
forvalues i = 1 / 5 {
	tab race race`i'
}

* summarize read math by race using forvalues
forvalues i = 1 / 5 {
	display "race: `i'"
	sum read math if race == `i'
}

* summarize read math by race using bysort
bysort race: sum read math




********** data visualization

* histogram		histogram

* graph box		boxplot

* scatter		scatter plot

* graph bar		bar plots

* twoway		layered graphics

* line			line plots

* load data hs0
use hs0, clear

* histogram write
histogram write

* histogram write with normal density and intervals of length 5
histogram write, normal width(5)

* boxplot of all test scores
graph box read write math science socst

* scatter plot of write vs read
scatter write read

* bar graph of count of ses
graph bar (count), over(ses)

* frequencies of gender by ses 
graph bar (count), over(ses) over(gender)

* frequencies of gender by ses asyvars colors bars by ses
graph bar (count), over(ses) over(gender) asyvars

label define genderlabel 1 "Male" 2 "Female"
label values gender genderlabel

* mean of write by gender and ses
graph bar (mean) write, over(ses) over(gender)

graph hbar (mean) write, over(gender) over(ses)

* twoway scatter plots of write and read colored by gender

scatter write read if gender == 1, mcolor(blue)

scatter write read if gender == 2, mcolor(red)

twoway scatter write read if gender == 1, mcolor(blue) || scatter write read if gender == 2, mcolor(red)

twoway (scatter write read if gender == 1, mcolor(blue))(scatter write read if gender == 2, mcolor(red))

* use /// to continue a command over multiple lines
twoway (scatter write read if gender == 1, mcolor(blue)) ///
	(scatter write read if gender == 2, mcolor(red))

* add title "Scatterplot of Reading and Writing"
twoway (scatter write read if gender == 1, mcolor(blue)) ///
	(scatter write read if gender == 2, mcolor(red)), ///
	title("Scatterplot of Reading and Writing")

* add ytitle "Score on Writing Test" and xtitle "Score on Reading Test"
twoway (scatter write read if gender == 1, mcolor(blue)) ///
	(scatter write read if gender == 2, mcolor(red)), ///
	title("Scatterplot of Reading and Writing") ///
	ytitle("Score on Writing Test") xtitle("Score on Reading Test")
	
* make a white background
twoway (scatter write read if gender == 1, mcolor(blue)) ///
	(scatter write read if gender == 2, mcolor(red)), ///
	title("Scatterplot of Reading and Writing") ///
	ytitle("Score on Writing Test") xtitle("Score on Reading Test") ///
	graphregion(color(white)) bgcolor(white)

* remove legend
twoway (scatter write read if gender == 1, mcolor(blue)) ///
	(scatter write read if gender == 2, mcolor(red)), ///
	title("Scatterplot of Reading and Writing") ///
	ytitle("Score on Writing Test") xtitle("Score on Reading Test") ///
	graphregion(color(white)) bgcolor(white) ///
	legend(off)
	
* legend male (gender=1) and female (gender=2) and remove title
* legend(lab ...)
twoway (scatter write read if gender == 1, mcolor(blue)) ///
	(scatter write read if gender == 2, mcolor(red)), ///
	ytitle("Score on Writing Test") xtitle("Score on Reading Test") ///
	graphregion(color(white)) bgcolor(white) ///
	legend(lab(1 "Male") lab(2 "Female"))

* legend(order ...)
twoway (scatter write read if gender == 1, mcolor(blue)) ///
	(scatter write read if gender == 2, mcolor(red)), ///
	ytitle("Score on Writing Test") xtitle("Score on Reading Test") ///
	graphregion(color(white)) bgcolor(white) ///
	legend(order(1 "Male" 2 "Female"))
	
* add linear relationship plot (lfit Y X)
twoway (scatter write read if gender == 1, mcolor(blue)) ///
	(scatter write read if gender == 2, mcolor(red)) ///
	(lfit write read if gender == 1, lcolor(blue)) ///
	(lfit write read if gender == 2, lcolor(red)), ///
	ytitle("Score on Writing Test") xtitle("Score on Reading Test") ///
	graphregion(color(white)) bgcolor(white) ///
	legend(order(1 "Male" 2 "Female"))

* save a graph "scatter_write_read_gender.png"
twoway (scatter write read if gender == 1, mcolor(blue)) ///
	(scatter write read if gender == 2, mcolor(red)) ///
	(lfit write read if gender == 1, lcolor(blue)) ///
	(lfit write read if gender == 2, lcolor(red)), ///
	ytitle("Score on Writing Test") xtitle("Score on Reading Test") ///
	graphregion(color(white)) bgcolor(white) ///
	legend(order(1 "Male" 2 "Female"))
graph export "scatter_write_read_gender.png", replace


* load data sp500 from Stata
sysuse sp500, clear

* scatter close date
scatter close date

* line close date
line close date

* twoway connected-line plot using scatter and line
twoway (scatter close date)(line close date)

* twoway connected-line plot using connected
twoway (connected close date)

* make a good-looking graph
twoway (scatter close date, mcolor(black) msize(vsmall)) ///
	(line close date, lcolor(black)), ///
	graphregion(color(white)) bgcolor(white) legend(off) ///
	tlabel(01jan2001 01apr2001 01jul2001 01oct2001 31dec2001, format(%tdmd))

twoway (connected close date, lcolor(black) mcolor(black) msize(vsmall)), ///
	graphregion(color(white)) bgcolor(white) legend(off) ///
	tlabel(01jan2001 01apr2001 01jul2001 01oct2001 31dec2001, format(%tdmd)) 

* reference
twoway (scatter write read if gender == 1, mcolor(blue)) ///
	(scatter write read if gender == 2, mcolor(red)) ///
	(lfit write read if gender == 1, lcolor(blue)) ///
	(lfit write read if gender == 2, lcolor(red)), ///
	ytitle("Score on Writing Test") xtitle("Score on Reading Test") ///
	graphregion(color(white)) bgcolor(white) ///
	legend(order(1 "Male" 2 "Female"))

********** exercise

* load data hs0

* twoway three scatter plots of math and science by ses

* color blue for low ses=1, black for middle ses=2, red for high ses==3

* symbol circle_hollow for low ses=1, diamond_hollow for middle ses=2, triangle_hollow for high ses==3
* hint: help scatter and see msymbol(symbolstylelist)

* add ytitle "Score on Math Test" and xtitle "Score on Science Test"
	
* xlabel from 20 to 80 for every 10

* make a white background

* legend low (ses=1), middle (ses=2), and high (ses=3) in a single row 

* add subtitle in legend "Socioeconomic Status" in 80% fontsize

* add linear relationship plot for each ses

* save a graph scatter_math_science_ses.png





********** exercise answer

* load data hs0
use hs0, clear

scatter math science if ses == 1
scatter math science if ses == 2
scatter math science if ses == 3

* twoway three scatter plots of math and science by ses
twoway (scatter math science if ses == 1)(scatter math science if ses == 2)(scatter math science if ses == 3)

* color blue for low ses=1, black for middle ses=2, red for high ses==3
twoway (scatter math science if ses == 1, mcolor(blue)) ///
	(scatter math science if ses == 2, mcolor(black)) ///
	(scatter math science if ses == 3, mcolor(red))

* symbol circle_hollow for low ses=1, diamond_hollow for middle ses=2, triangle_hollow for high ses==3
* hint: help scatter and see msymbol(symbolstylelist)
twoway (scatter math science if ses == 1, mcolor(blue) m(Oh)) ///
	(scatter math science if ses == 2, mcolor(black) m(Dh)) ///
	(scatter math science if ses == 3, mcolor(red) m(Th))

* add ytitle "Score on Math Test" and xtitle "Score on Science Test"
twoway (scatter math science if ses == 1, mcolor(blue) m(Oh)) ///
	(scatter math science if ses == 2, mcolor(black) m(Dh)) ///
	(scatter math science if ses == 3, mcolor(red) m(Th)), ///
	ytitle("Score on Math Test") xtitle("Score on Science Test")
	
* xlabel from 20 to 80 for every 10
twoway (scatter math science if ses == 1, mcolor(blue) m(Oh)) ///
	(scatter math science if ses == 2, mcolor(black) m(Dh)) ///
	(scatter math science if ses == 3, mcolor(red) m(Th)), ///
	ytitle("Score on Math Test") xtitle("Score on Science Test") ///
	xlabel(20(10)80)

* make a white background
twoway (scatter math science if ses == 1, mcolor(blue) m(Oh)) ///
	(scatter math science if ses == 2, mcolor(black) m(Dh)) ///
	(scatter math science if ses == 3, mcolor(red) m(Th)), ///
	ytitle("Score on Math Test") xtitle("Score on Science Test") ///
	xlabel(20(10)80) graphregion(color(white))

* legend low (ses=1), middle (ses=2), and high (ses=3) in a single row 
twoway (scatter math science if ses == 1, mcolor(blue) m(Oh)) ///
	(scatter math science if ses == 2, mcolor(black) m(Dh)) ///
	(scatter math science if ses == 3, mcolor(red) m(Th)), ///
	ytitle("Score on Math Test") xtitle("Score on Science Test") ///
	xlabel(20(10)80) graphregion(color(white)) bgcolor(white) ///
	legend(lab(1 "Low") lab(2 "Middle") lab(3 "High") row(1))

twoway (scatter math science if ses == 1, mcolor(blue) m(Oh)) ///
	(scatter math science if ses == 2, mcolor(black) m(Dh)) ///
	(scatter math science if ses == 3, mcolor(red) m(Th)), ///
	ytitle("Score on Math Test") xtitle("Score on Science Test") ///
	xlabel(20(10)80) graphregion(color(white)) bgcolor(white) ///
	legend(order(1 "Low" 2 "Middle" 3 "High") row(1))

* add subtitle in legend "Socioeconomic Status" in 80% fontsize
twoway (scatter math science if ses == 1, mcolor(blue) m(Oh)) ///
	(scatter math science if ses == 2, mcolor(black) m(Dh)) ///
	(scatter math science if ses == 3, mcolor(red) m(Th)), ///
	ytitle("Score on Math Test") xtitle("Score on Science Test") ///
	xlabel(20(10)80) graphregion(color(white)) bgcolor(white) ///
	legend(order(1 "Low socieconomic status" 2 "Middle socioeconomic status" 3 "High socioeconomic status") row(3) subtitle("Socioeconomic Status", size(*.8)))

* add linear relationship plot for each ses
twoway (scatter math science if ses == 1, mcolor(blue) m(Oh)) ///
	(scatter math science if ses == 2, mcolor(black) m(Dh)) ///
	(scatter math science if ses == 3, mcolor(red) m(Th)) ///
	(lfit math science if ses == 1, lcolor(blue) lpattern(-) lwidth(thick)) ///
	(lfit math science if ses == 2, lcolor(black) lpattern(.) lwidth(thick)) ///
	(lfit math science if ses == 3, lcolor(red) lpattern(-.-) lwidth(thick)), ///
	ytitle("Score on Math Test") xtitle("Score on Science Test") ///
	xlabel(20(10)80) graphregion(color(white)) bgcolor(white) ///
	legend(order(1 "Low" 2 "Middle" 3 "High") row(1) subtitle("Socioeconomic Status", size(*.8)))

* save a graph scatter_math_science_ses.png
twoway (scatter math science if ses == 1, mcolor(blue) m(Oh)) ///
	(scatter math science if ses == 2, mcolor(black) m(Dh)) ///
	(scatter math science if ses == 3, mcolor(red) m(Th)) ///
	(lfit math science if ses == 1, lcolor(blue) lpattern(dash) lwidth(medthick)) ///
	(lfit math science if ses == 2, lcolor(black) lpattern(dash) lwidth(medthick)) ///
	(lfit math science if ses == 3, lcolor(red) lpattern(dash) lwidth(medthick)), ///
	ytitle("Score on Math Test") xtitle("Score on Science Test") ///
	xlabel(20(10)80) graphregion(color(white)) bgcolor(white) ///
	legend(order(1 "Low" 2 "Middle" 3 "High") row(1) subtitle("Socioeconomic Status", size(*.8)))
graph export "scatter_math_science_ses.png", replace





********** assignment 2

* open a log file assignment2.txt

* do all exerices 

* load data sp500 from Stata

/* create change_`v' that takes the difference between today and yesterday's data
for each varaible using foreach: open high low close volume
hint: a variable change(Closing price change) should be equal to change_close you create
hint: yesterday's data is `v'[_n-1] */

* create gr_`v' that takes the daily growth rate for each `v' using foreach: open high low close volume 
* hint: growth rate is the change relative to the previous data = (today - yesterday) / yesterday

* find out
* 1) how many days high price increased by more than 3%, 
* 2) how many days high price decreased by more than 3%, 
* 3) how many days close price increased by more than 3%, 
* 4) how many days close price decreased by more than 3%

* create a variable month to indicate a month of date
* hint: use the month command

* collpase data that contains a mean of open close, a max of high, a min of low, and a sum of volumn by month

* make a bar graph of volume over month

* add ytitle "Volume" and xtitle "Month" (hint: use b1title for xtitle)

* change bar color to gray and make a white background

* save a graph volume_month.png

* make two connected-lines for high price and low price in a single figure
* hint: for high price, use (connected high month)

* high price for red line and vsmall size red marker
* low price for blue dashed line and vsmall size blue marker

* change xlabel from 1 to 12 by 1 month

* add ytitle "Stock price" and xtitle "Month"

* make legend 1 "High" 2 "Low"

* make a white background

* save a graph high_low_month.png

* close a log file



********** assignment 2 answer

* open a log file assignment2.txt
log using assignment2.txt, text replace

* load data sp500 from Stata
sysuse sp500, clear

/* create change_VARIABLE that takes the difference between today and yesterday's data
for each VARIABLE using foreach: open high low close volume
hint: a variable change(Closing price change) should be equal to change_close you create
hint: yesterday's data is VARIABLE[_n-1] */

*gen open_yesterday = open[_n-1]
*gen change_open = open - open_yesterday

local i = 0
foreach v of var open high low close volume {
	local i = `i' + 1
	display ""
	display "`i'"
	display "using `v'"
	display "create change_`v'"
	gen change_`v' = `v' - `v'[_n-1]
}

sysuse sp500, clear
gen open_1 = open[_n-1]
gen change_open = open - open_1
l date *open* in 1/10

sysuse sp500, clear
gen change_open = open - open[_n-1]
l date *open* in 1/10

* create gr_VARIABLE that takes the daily growth rate for each VARIABLE using foreach: open high low close volume 
* hint: growth rate is the change relative to the previous data = (today - yesterday) / yesterday

sysuse sp500, clear
foreach v of var open high low close volume {
	gen gr_`v' = (`v'-`v'[_n-1]) / `v'[_n-1]
}

sysuse sp500, clear
gen open_1 = open[_n-1] // yesterday
gen change_open = open - open_1 // difference = today - yesterday
gen gr_open = (open - open_1) / open_1 // growth rate = difference / yesterday
l date *open* in 1/10

sysuse sp500, clear
gen gr_open = (open - open[_n-1]) / open[_n-1]
l date *open* in 1/10



sysuse sp500, clear
foreach v in open high low close volume {	
	display "`v'"
	gen gr_`v' = (`v'[_n] - `v'[_n-1]) / `v'[_n-1]
}



* find out
* 1) how many days high price increased by more than 3%,
count if gr_high > 0.03 & ~missing(gr_high)
l if gr_high > 0.03 & ~missing(gr_high)

* 2) how many days high price decreased by more than 3%, 
count if gr_high < -0.03 & ~missing(gr_high)
l if gr_high < -0.03 & ~missing(gr_high)

* 3) how many days close price increased by more than 3%, 
count if gr_close > 0.03 & ~missing(gr_close)
l if gr_close > 0.03 & ~missing(gr_close)

* 4) how many days close price decreased by more than 3%
count if gr_close < -0.03 & ~missing(gr_close)
l if gr_close < -0.03 & ~missing(gr_close)

foreach v of var gr_* {
	display "`v'"
	count if `v' > 0.03 & ~missing(gr_high)
	count if `v' < -0.03 & ~missing(gr_high)
}

* 1) 2
* 2) 2
* 3) 4
* 4) 4

* create a variable month to indicate a month of date
* hint: use the month command
gen month = month(date)
gen day = day(date)
gen year = year(date)

* collpase data that contains a mean of open close, a max of high, a min of low, and a sum of volumn by month
collapse (mean) open close (max) high (min) low (sum) volume, by(month)

* make a bar graph of volume over month
graph bar volume, over(month)

* add ytitle "Volume" and xtitle "Month" (hint: use b1title for xtitle)
graph bar volume, over(month) ///
	ytitle("Volume") b1title("Month")

* change bar color to gray and make a white background
graph bar volume, over(month) bar(1, color(gray)) ///
	ytitle("Volume") b1title("Month") ///
	graphregion(color(white)) bgcolor(white)

* save a graph volume_month.png
graph bar volume, over(month) bar(1, color(gray)) ///
	ytitle("Volume") b1title("Month") ///
	graphregion(color(white)) bgcolor(white)
graph export "volume_month.png", replace

* make two connected-lines for high price and low price in a single figure
* hint: for high price, use (connected high month)
twoway (connected high month)(connected low month)

twoway (line high month)(line low month)


* high price for red line and vsmall size red marker
* low price for blue dashed line and vsmall size blue marker
twoway (connected high month, lcolor(red) mcolor(red) msize(vsmall)) ///
	(connected low month, lcolor(blue) lpattern(dash) mcolor(blue) msize(vsmall))

* change xlabel from 1 to 12 by 1 month
twoway (connected high month, lcolor(red) mcolor(red) msize(vsmall)) ///
	(connected low month, lcolor(blue) lpattern(dash) mcolor(blue) msize(vsmall)), ///
	xlabel(1(1)12)

* add ytitle "Stock price" and xtitle "Month"
twoway (connected high month, lcolor(red) mcolor(red) msize(vsmall)) ///
	(connected low month, lcolor(blue) lpattern(dash) mcolor(blue) msize(vsmall)), ///
	xlabel(1(1)12) ///	
	ytitle("Stock price") xtitle("Month")

* make legend 1 "High" 2 "Low"
twoway (connected high month, lcolor(red) mcolor(red) msize(vsmall)) ///
	(connected low month, lcolor(blue) lpattern(dash) mcolor(blue) msize(vsmall)), ///
	xlabel(1(1)12) ///	
	ytitle("Stock price") xtitle("Month") ///
	legend(order(1 "High" 2 "Low"))

* make a white background
twoway (connected high month, lcolor(red) mcolor(red) msize(vsmall)) ///
	(connected low month, lcolor(blue) lpattern(dash) mcolor(blue) msize(vsmall)), ///
	xlabel(1(1)12) ///	
	ytitle("Stock price") xtitle("Month") ///
	legend(order(1 "High" 2 "Low")) ///
	graphregion(color(white)) bgcolor(white)

* save a graph high_low_month.png
twoway (connected high month, lcolor(red) mcolor(red) msize(vsmall)) ///
	(connected low month, lcolor(blue) lpattern(dash) mcolor(blue) msize(vsmall)), ///
	xlabel(1(1)12) ///	
	ytitle("Stock price") xtitle("Month") ///
	legend(order(1 "High" 2 "Low")) ///
	graphregion(color(white)) bgcolor(white)
graph export "high_low_month.png", replace

* close a log file
log close



******************************************
********** Module III
******************************************

********** data analysis

* load data hs0
use hs0, replace

* create a variable female that takes 1 if gender=2 and 0 otherwise
gen female = gender == 2

* test if reading score is different between females and males using ttest
bysort female: sum read

ttest read, by(female)

diff: 1.090231
se: 1.457507

display 1.090231/1.457507

.74801082

t = diff / se

H0: diff = 0


* how to interpret

* about t statistics > 2 or p-value < 0.1
* => mean0-mean1 is different from zero
* => different between mean0 and mean1

* about t statistics < 2 or p-value > 0.1 
* => mean0-mean1 is not different from zero
* => not different between mean0 and mean1

* correlation between read and female
corr read female

* significance level using pwcorr with sig
pwcorr read female, sig

* regress read female
regress read female

* simple linear regression: y = a + b * x + e
* b = cov(x,y) / var(x)

* covariance between read(y) and female(x)
corr read female, cov

* get detailed information
return list
* r(cov_12): -.2717085427135678

* variance of female(x)
sum female
return list
* r(Var): .2492211055276382

* beta = -.271709 / .24922111
display -.2717085427135678 / .24922111

* -1.090231

* cheack coefficient b using reg read female
reg read female

* ttest if each score (read write math science socst) is different between females and males using foreach
foreach v of var read write math science socst {
	display ""
	display "`v'"
	ttest `v', by(female)
}

* interpret



********** exercise

* create a variable white that takes 1 if race=white and 0 otherwise

* ttest if each score (read write math science socst) is different between white and non-white using foreach

* at 1% significance level, which score is different between them? which score is not different between them?

* covariance between read and white

* variance of white

* calculate b = cov(x,y) / var(x)

* check coefficient b using reg read white





********** exercise answer

* create a variable white that takes 1 if race=white and 0 otherwise
gen white = race == 4

* ttest if each score (read write math science socst) is different between white and non-white using foreach
foreach v of var read write math science socst {
	display ""
	display "`v'"
	ttest `v', by(white)
}

* at 1% significance level, which score is different between them? which score is not different between them?
* => socst: p-value = 0.0170 => not different between them at 1% significance level 
* 			(but different between them at 5% significance level)
* => other scores are different between them at 1% significance level b/c p-value < 0.01

* covariance between read and white
corr read white, cov
* cov: 1.13121

return list
* cov: 1.131206030150754

* variance of white
sum white
return list
* r(Var): .2047989949748744

* b = cov(x,y) / var(x)
* b = 1.131206030150754 / .2047989949748744
display 1.131206030150754 / .2047989949748744

* check coefficient b using reg read white
reg read white

white: = 1 for White students, = 0 for non-White students
white: 0 => 1 
coefficient : change in y in response to change in x by 1-unit increase (0=>1) 
coefficient : change in reading score by about 5.5 (in response to change in white by 1-unit increase = for white students)

=> white students have a higher reading score by about 5.5 than non-white students


********** regression analysis

* research question: effect of x on y
* e.g. effect of private schooling on academic performance
* x: private schooling
* y: academic performace, read write math ...

* load data hs0
use hs0, clear

* create a variable private that takes 1 if schtyp=2 and 0 otherwise
gen private = schtyp == 2

tab schtyp private

* create a variable female that takes 1 if gender=2 and 0 otherwise
gen female = gender == 2

* measure the effect of private schooling (x) on writing test score (y) using regress write private 
regress write private

private =1 if private, =0 if non-private
coefficient : how much change in y in response to 1-unit increase in x (0=>1) 
coefficient : increase in writing score by about 3.28 (in response to 1-unit increase in private = for private schooling)
=> private schooling increases writing score by about 3.28 (6.2%)

sum write 

mean of dep.var: 52.775
coefficient: 3.28125

coefficient / mean of dep.var
display 3.28125 / 52.775




return list

ereturn list 

* coefficient
_b[x]

display _b[private]

* s.e.
_se[x]

display _se[private]

* t-stat
display _b[private] / _se[private]

* p-value (after regress write private)
test private

* r-squared
display e(r2)

ereturn list


* use robust s.e.
reg write private
reg write private, robust


* differential effect by gender? gender gap in effect of private schooling?

* include a variable female
reg write private female, robust

* create a variable privateXfemale that interact a variable private with a variable female
gen privateXfemale = private * female

tab private female

tab privateXfemale

tab privateXfemale private

tab privateXfemale female

* include an interaction term privateXfemale
reg write private female privateXfemale, robust

y = alpha(_cons) + beta1 * private + beta2 * female + beta3 * privateXfemale + error

* interpret
tab private female

* private = 0, female = 0: no coefficient (only constant) => alpha
* private = 0, female = 1: coefficient on female => alpha + beta2
* private = 1, female = 0: coefficient on private => alpha + beta1
* private = 1, female = 1: coefficients on private female privateXfemale => alpha + beta1 + beta2 + beta3

* => beta3 : measure the gender gap in private schooling
* => beta3 : -3.114386(se: 2.976756) => (effect of private schooling decreases for females, but not stat. sig.
* => no gender gap in private schooling 

* use ##
reg write private##female, robust

* use a subsample of females
reg write private if female == 1, robust

* use a subsample of males
reg write private if female == 0, robust


*** effect of private on write
* reg, no control
reg write private, robust

* reg, control variables (controls): female race
reg write private female race, robust
* => wrong. why? race is a categorical variable, neither dummy nor continous variable.

tab race

* use i.race
reg write private female i.race, robust
* => where is hispanic? omitted due to collinearity

* suppose x3 = x1 + x2
* y = beta1 * x1 + beta2 * x2 + beta3 * x3 (X) why? 

* y = beta1 * x1 + beta2 * x2 + beta3 * (x1 + x2)

* race = hisp, asia, black, white, or race5
* hisp + asia + black + white + race5 = 1 





* create a variable hispanic
gen hispanic = race == 1

* create a variable asian
gen asian = race == 2

* create a variable black
gen black = race == 3

* create a variable white
gen white = race == 4

* create a variable race5
gen race5 = race == 5

* include 5 races: hispanic asian black white race5
reg write private female hispanic asian black white race5, robust

gen race0 = hispanic + asian + black + white + race5

* hispanic + asian + black + white + race5 = 1
* race5 = 1 - (hispanic + asian + black + white)

* y = beta * private + beta1 * hispanic + beta2 * asian + beta3 * black + beta4 * white + beta5 * race5

* y = beta * private + beta1 * hispanic + beta2 * asian + beta3 * black + beta4 * white + beta5 * {1 - (hispanic + asian + black + white)}

* use i.race
reg write private female i.race, robust

* include 4 races except for hispanic: asian black white race5
reg write private female asian black white race5, robust

* interpret coefficients

* include 4 races except for asian: hispanic black white race5
reg write private female hispanic black white race5, robust

* use ib2.race (omit race=2)
reg write private female ib2.race, robust

* interpret coefficients



********** exercise

* add controls for socioeconomic status, ses

* interpret coefficients on ses

* add controls for program type, prgtype

* if you face an error message "string variables may not be used as factor variables"
* encode prgtype and generate a variable prog

* control for program type, prog

* interpret coefficients on prog

* interpret coefficient on private schooling

* measure the effect of private schooling on other test scores (read math science socst) using foreach
* no control

* interpret coefficient on private schooling for each test score





********** exercise answer

* y = beta * x
* reg y x

* y = beta * x + control1 + control2 + ...
* reg y x control1 control2 ...

tab ses
* control for socioeconomic status, ses
reg write private female i.race i.ses, robust

* interpret coefficients on ses
* => a high level of ses is likely to have a higher writing test score than a low level of ses

tab prgtype
* control for program type, prgtype
reg write private female i.race i.ses i.prgtype, robust

* if you face an error message "string variables may not be used as factor variables"
* encode prgtype and generate a variable prog
encode prgtype, gen(prog)

* control for program type, prog
reg write private female i.race i.ses i.prog, robust

* interpret coefficients on prog
* => general and vocational programs are likely to have a lower writing test than academic

* interpret coefficient on the effect of private
* => not significant anymore, why? omitted variable bias (ovb)

* measure the effect of private schooling on academic performace
* other test scores (read math science socst) using foreach
* no control
foreach v of var read math science socst {
	reg `v' private, robust
}

* interpret coefficient on private schooling
* => positive effects but insignificant
* => no effect of privat


**************************************************
*********** Practical Work on PSLM Data **********
**************************************************

* creating working directories

mkdir data
mkdir data\raw
mkdir data\raw\pslm2019-20
mkdir data\raw\pslm2014-15
mkdir data\clean
mkdir data\clean\pslm2019-20
mkdir data\clean\pslm2014-15


*2019-20 Section A: Roster

* import
use "https://drive.usercontent.google.com/download?id=1BWKg0kgvSSCK9xcHzQPu-7aL5vEcbrW7&export=download&authuser=2&confirm=t&uuid=adbc1846-ee65-4089-aeca-5ab5fc2757e7&at=APZUnTXaHjZYDFKJ7U99Y2DtI9pk:1704087700825", clear

* save raw data
save ".\data\raw\pslm2019-20\1.dta", replace


* rename variable
rename language lang

* cleaning date variable
list int_date in 1/5

* we need to substring ten digits 2019-12-31 
g i = substr(int_date, -19, 10)
list i in 1/5

* formating new date variable
gen interview_date = date(i, "YMD")
list interview_date in 1/5

format interview_date %td
list interview_date in 1/5

* dropping extra variables
drop int_date i

* rename to original name
rename interview_date int_date

* generating year variable from date
gen year = year(int_date)
ta year

* replace wrong years
ta year
replace year = 2019 if year <= 2019
replace year = 2020 if year >= 2020
* it also replaced the missing values but we know the survey was conducted in 2020

* drop extra variables
keep  psu hhcode int_date lang year

* some variable could be encoded, coonsidering that we will append the data, we need to remove the value labels

* List all variables in the dataset
ds, has(vallabel) 
* language is encoded

* Get a list of variables with value labels
local allvars `r(varlist)'
* Loop through each variable
foreach var in `allvars' {
    * Decode the variable if it has value labels
    decode `var', gen(`var'_decoded)
    
    * Drop the original variable
    drop `var'
}

* save clean data
save ".\data\clean\pslm2019-20\1.dta", replace



********** exercise



*2014-15 Section A: Roster

* import
use "https://drive.usercontent.google.com/download?id=1V4-HKgeCEH0RF9GvygS-sGx0_LoQpscH&export=download&authuser=2&confirm=t&uuid=4b395644-ab76-4ba5-a5e9-582c3d41b16f&at=APZUnTU9gKTwRQGjcyxj_TydmzjJ:1704086559264", clear

* save raw data in data\raw\pslm2014-15 and name it 1

* rename variable langauge to lang

* cleaning and format the interview date variable and name it int_date
* hint: since the year, month and day are given seprately, you can use gen int_date = mdy(int_month, int_day, int_year)

* generate a year variable and drop if there is wrong year

* keep only relevant variable that we kept in 2019-20 survey i.e. psu hhcode int_date lang year

* some variable could be encoded, coonsidering that we will append the data, we need to remove the value labels (use loop)


* save clean data in data\clean\pslm2014-15 and name it 1


***** exercise asnwer


*Importing Section A: Roster
use "https://drive.usercontent.google.com/download?id=1V4-HKgeCEH0RF9GvygS-sGx0_LoQpscH&export=download&authuser=2&confirm=t&uuid=4b395644-ab76-4ba5-a5e9-582c3d41b16f&at=APZUnTU9gKTwRQGjcyxj_TydmzjJ:1704086559264", clear

* save raw data in data\raw\pslm2014-15 and name it 1
save ".\data\raw\pslm2014-15\1.dta", replace

* rename variable
rename language lang


* cleaning and format the interview date variable and name it int_date
* hint: since the year, month and day are given seprately, you can use gen int_date = mdy(int_month, int_day, int_year)
* generate a year variable and drop if there is wrong year

rename int_date int_day
gen int_date = mdy(int_month, int_day, int_year)
rename int_year  year

* keep only relevant variable that we kept in 2019-20 survey i.e. psu hhcode int_date lang year
keep  psu hhcode int_date lang year

* List all variables in the dataset
ds, has(vallabel) 
* Get a list of variables with value labels
local allvars `r(varlist)'
* Loop through each variable
foreach var in `allvars' {
    * Decode the variable if it has value labels
    decode `var', gen(`var'_decoded)
    
    * Drop the original variable
    drop `var'
}

* save clean data in data\clean\pslm2014-15 and name it 1
save ".\data\clean\pslm2014-15\1.dta", replace




* 2019-20 Section B: HH Characteristics
use "https://drive.usercontent.google.com/download?id=14cwuvSgig3_U3chMnCWRfawG4zNpGKgw&export=download&authuser=2&confirm=t&uuid=3f0e88ec-b827-4e21-bf80-91f7a4f1b4a5&at=APZUnTW_SRZ7akIrTqI-evCB0VO-:1704087649762", clear

* save raw data
save ".\data\raw\pslm2019-20\2.dta", replace

* renaming a couple of variables
rename sb1q4 gender
rename sb1q64 yob
rename sb1q63 mob
rename sb1q62 dob
rename sb1q7 marst
rename sb1q2 relation

* keep only relevant variables
keep  psu hhcode district region idc gender yob mob dob marst age

* remove the value labels from all variables
ds, has(vallabel) 
local allvars `r(varlist)'
foreach var in `allvars' {
    decode `var', gen(`var'_decoded)
    drop `var'
}

* save clean data
save ".\data\clean\pslm2019-20\2.dta", replace



***** exercise
* 2014-15 Section B: HH Characteristics

*Importing Section B: HH Characteristics
use "https://drive.usercontent.google.com/download?id=1G38cxZVxlcyxHv8aDl2dEzkrO01HZrpo&export=download&authuser=2&confirm=t&uuid=3cac0b42-6707-4f27-b0ca-a9c8febcfafd&at=APZUnTVl-JRgbx2AHipbp3hw4HmP:1704086563896", clear

* save raw data in "data\raw\pslm2014-15" and name it 2


* rename following variables sbq04 > gender, sbq61 > yob, sbq62 > mob, sbq63 > dob, sbq07 > marst

* drop extra variables (keep only psu hhcode district region idc gender yob mob dob marst age)


* remove value labels

* save clean data in "data\clean\pslm2014-15" and name it 2





***** exercise answers
* 2014-15 Section B: HH Characteristics

*Importing Section B: HH Characteristics
use "https://drive.usercontent.google.com/download?id=1G38cxZVxlcyxHv8aDl2dEzkrO01HZrpo&export=download&authuser=2&confirm=t&uuid=3cac0b42-6707-4f27-b0ca-a9c8febcfafd&at=APZUnTVl-JRgbx2AHipbp3hw4HmP:1704086563896", clear

* save raw data in "data\raw\pslm2014-15" and name it 2
save ".\data\raw\pslm2014-15\2.dta", replace

* rename following variables sbq04 > gender, sbq61 > yob, sbq62 > mob, sbq63 > dob, sbq07 > marst
rename sbq04 gender
rename sbq61 yob
rename sbq62 mob
rename sbq63 dob
rename sbq07 marst

* drop extra variables (keep only psu hhcode district region idc gender yob mob dob marst age)
keep  psu hhcode district region idc gender yob mob dob marst age

* remove value labels
ds, has(vallabel) 
local allvars `r(varlist)'
foreach var in `allvars' {
    decode `var', gen(`var'_decoded)
    drop `var'
}

* save clean data in "data\clean\pslm2014-15" and name it 2
save ".\data\clean\pslm2014-15\2.dta", replace





***** merging
clear

* use any of the file
use ".\data\clean\pslm2019-20\1.dta", replace

* find unique or repeated id variables
ssc install unique

* hhcode is unique variable
unique hhcode

* now check the unique value in other file
use ".\data\clean\pslm2019-20\2.dta", replace

* find unique values in id variable
unique hhcode
* hhcode is repeated
unique idc
* idc is also repeated 
* so we will try both
unique hhcode idc

* we will use m:1 considering the hhcode
merge m:1 hhcode using ".\data\clean\pslm2019-20\1.dta", keep(master match) nogen

* save with a new name
save ".\data\clean\pslm2019-20\merged.dta", replace








***** exercise
clear

* use 2014-15 file 1

* find unique or repeated id variables

* now check the unique value in other file

* find unique values
* try hhcode

* try idc

* try both

* merge both files


* save in data\clean\pslm2014-15 with a new name merged





***** exercise asnwers
clear

* use 2014-15 file 1
use ".\data\clean\pslm2014-15\1.dta", replace

* find unique or repeated id variables
* hhcode is unique variable
unique hhcode

* now check the unique value in other file
use ".\data\clean\pslm2014-15\2.dta", replace

* find unique values
* try hhcode
unique hhcode

* try idc
unique idc

* try both
unique hhcode idc

* we will use m:1 considering the hhcode
merge m:1 hhcode using ".\data\clean\pslm2014-15\1.dta", keep(master match) nogen

* save with a new name
save ".\data\clean\pslm2014-15\merged.dta", replace




****** appending 

* use any commin file from any survey
use ".\data\clean\pslm2014-15\1.dta", replace

* check the order of variables
* hhcode psu year int_date lang_decoded

* use other file
use ".\data\clean\pslm2019-20\1.dta", replace

* use order code to order variables if they are not
order hhcode psu year int_date lang_decoded

* appending
append using ".\data\clean\pslm2014-15\1.dta"

* check year
ta year

* save with a new name
sa ".\data\clean\appended_1.dta", replace



****** exercise 

* use file 2 from year 2014-15

* check the order of variables
* hhcode psu idc yob mob dob age region_decoded district_decoded gender_decoded marst_decoded

* use other file

* use order code to order variables if they are not

* appending

* variable mob is byte in master but string in using file
* go back to using file and destring it

* open the using file

* destring mob

* replace the existing file
* now you can append here

* variable dob is string in master so destring it

* try append again

* save with a new names








****** exercise anaswer


* use file 2 from year 2014-15
use ".\data\clean\pslm2014-15\2.dta", replace

* check the order of variables
* hhcode psu idc yob mob dob age region_decoded district_decoded gender_decoded marst_decoded

* use other file
use ".\data\clean\pslm2019-20\2.dta", replace

* use order code to order variables if they are not
order hhcode psu idc yob mob dob age region_decoded district_decoded gender_decoded marst_decoded

* appending
append using ".\data\clean\pslm2014-15\2.dta"

* variable mob is byte in master but string in using file
* go back to using file and destring it

* open the usin file
use ".\data\clean\pslm2014-15\2.dta", replace

* destring mob
destring mob, replace

* replace the existing file
sa ".\data\clean\pslm2014-15\2.dta", replace

* now you can append here
append using ".\data\clean\pslm2019-20\2.dta"

* variable dob is string in master so destring it
destring dob, replace

* try append again
append using ".\data\clean\pslm2019-20\2.dta"

* save with a new names
sa ".\data\clean\appended_2.dta", replace



****** append merged file

* appending merged files
use ".\data\clean\pslm2019-20\merged.dta", replace

* describe all variables
des

*--------------------------------------------------------------------------------------------------------------------------------------------
*Variable      Storage   Display    Value
    name         type    format    label      Variable label
*--------------------------------------------------------------------------------------------------------------------------------------------
*hhcode          long    %12.0g                
*psu             double  %12.0g                
*idc             byte    %8.0g                 
*age             byte    %8.0g                 age in complete years year of birth
*dob             byte    %8.0g                 days
*mob             byte    %8.0g                 month
*yob             int     %8.0g                 year of birth
*region_decoded  str5    %9s                   
*district_deco~d str21   %21s                  
*gender_decoded  str6    %9s                   gender of person
*marst_decoded   str46   %46s                  marital status
*int_date        float   %td                   
*year            float   %9.0g                 
*lang_decoded    str13   %13s                  
*--------------------------------------------------------------------------------------------------------------------------------------------

* check the variable type in other file
use ".\data\clean\pslm2014-15\merged.dta", replace

* describe all variables
des

* see the differences in terms of text and numericla variables
* mob is string in 2014-15
* dob us string in 2014-15

* destring them
destring mob, replace
destring dob, replace

* append merged file
append using ".\data\clean\pslm2019-20\merged.dta"

* save with a new names
sa ".\data\clean\appended_merged.dta", replace


