Data for analyses and R-scripts for making figures that were used in the paper:
"Challenges and opportunities using hunters to monitor Chronic Wasting Disease 
among wild reindeer in the digital era" by Atle Mysterud et al. 

1) Read data used for "probability of freedom"-analyses

##Read data set for "probability of freedom" - analyses----
Ndat<-read.csv(file="Ndat_probfree_wildreindeer.csv",row.names=1)

#Or use the alternative
#Ndat<-read.table(file="Ndat_probfree_wildreindeer.txt",sep="\t",dec=".")

"Ndat" refers to a data frame with 105 rows and 11 columns 

Data in "Ndat" were specified and summarized according to parameters given by the columns:
Year - Specify the year of the data from the time period 2017-2021
Ntot - Population size
pN1 - proportion of yearlings in the population 
pNadf - proportion of adult females in the population
pNadm - proportion of adult males in the population
Area - Specify the management area of the population
nY - number of samples tested from yearlings
nAdf - number of samples tested from adult females
nAdm - number of samples tested from adult males
pRLN - proportion of samples including tissue sample from lymph nodes 
nPrRLN  - number of samples including tissue sample from lymph nodes 

2) The r-script: Make_FIGURE3AB.R
Reads the data frame "sumdat_harvest_tested_locyear.csv" for making Fig 3A and Fig 3B.

For each of 18 wild reindeer management areas and for each of the years 2016-2021,
this data frame give 
the number of harvested (sum_harvest), 
number of animals tested (sum_tested), 
proportion of harvested animals tested (ptested),
proportion of samples including lymph node tissue (pRLN)
and the group utilised for plot legend (group).

3) The r-script: Make_Figure4.R
Reads the data ("pdat" and "popndat") and produces the Fig 4.

"popndat" - data frame that for each wild reindeer management area (Area) is
showing numbers (Variable) as specified by the column (Vgroup),
corresponding to either population size (sum_population),
total number of animals tested 2016-2021 (sum_tested), or
total number of samples (2016-2021) including lymph node tissue (sum_RLN).

"pdat" - data frame which show the output of the annual "probability-of-freedom analysis" after testing the harvest in 2021.
Area - Name of the reindeer management area
Year - The last year of survey included in the analysis (2021)
SSe - The surveillance sensitivity for 2021 - the average probability that the surveillance will return a positive outcome, if CWD is present in the population at or above the design prevalence.
priorPFree - The estimated mean probability of freedom (CWD absent or present below design prevalence) after the previous years of testing
p.intro - Yearly probability of new introduction 
priorPInf - The estimated mean probability of population being infected (at or above the design prevalence) after the previous years of testin
PFree - Estimated mean probability of being free from infection at the design prevalence
perc025 - The 2.5th lower percentile of being free from infection at the design prevalence
perc050 - The median estimate of being free from infection at the design prevalence
perc975 - The 97.5th higher percentile of being free from infection at the design prevalence
Ntot - Population size
n_tested - Total number of animals tested in 2021
n_Adm - Number of adults (2 years or older) tested in 2021
pstar - The design prevalence used for the analysis
pstar1 - Same as pstar, but reformulated to fit for figure legend.


The probability of freedom was only calculated for design prevalences corresponding to a lower threshold of at least 4 infected individuals in the population.
PFree was set no NA in cases the design prevalence corresponded to an expected number of less than 4 infected individuals (small populations).

