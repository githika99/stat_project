library(readxl)
library(tidyverse)
library(naniar)
library(superheat)
library(patchwork)

Data_gfg <- read_excel("Arizona_Department_of_Corrections_Cost_Report_2020.xlsx", col_types = "text")

Data_gfg_clean <- Data_gfg[, colSums(!is.na(Data_gfg) & Data_gfg != "") > 0] # remove empty columns

Data_gfg_clean

# range range to read, like "B3:D87". col_types types (numeric, text). col_names - specify a name for each column
#datasets <- readxl_example("/Users/githika/GitHub/stat_project/Arizona_Department_of_Corrections_Cost_Report_2020.xlsx")
shorter_dataset <- read_excel("Arizona_Department_of_Corrections_Cost_Report_2020.xlsx", range = "A81:BO96", 
                              col_names = c("CUSTODY", "ADP", " ", "UNIT DIRECT", "COMPLEX DIRECT", " ", "TOTAL DIRECT", , " ", "TOTAL INDIRECT", , " ", "TOTAL EXPENSE"), 	
                              col_types = c(text, numeric, numeric,numeric, numeric,numeric, numeric,numeric, numeric,numeric, numeric)
                              )
# remove empty cols
shorter_dataset <- shorter_dataset[, colSums(!is.na(shorter_dataset) & shorter_dataset != "") > 0] # remove empty columns

# rename
write_csv(shorter_dataset, "State_Prison_Complexes_Revenue.csv")


# 2. shorter_dataset <- read_excel("Arizona_Department_of_Corrections_Cost_Report_2020.xlsx", range = "A81:BO96", 
shorter_dataset <- read_excel(
  "Arizona_Department_of_Corrections_Cost_Report_2020.xlsx",
  range = "A97:BO109",
  col_names = c(
    "CUSTODY", "ADP", "BLANK1", "UNIT_DIRECT", "COMPLEX_DIRECT", "BLANK2",
    "TOTAL_DIRECT", "BLANK3", "BLANK4", "TOTAL_INDIRECT", "BLANK5", "BLANK6", "TOTAL_EXPENSE"
  ),
  col_types = c(
    "text", "numeric", "numeric", "numeric", "numeric", "numeric",
    "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"
  )
)
# remove empty cols
shorter_dataset <- shorter_dataset[, colSums(!is.na(shorter_dataset) & shorter_dataset != "") > 0] # remove empty columns

# rename
write_csv(shorter_dataset, "Private_Prison_Complexes_Revenue.csv")


#read_excel(datasets, range = "A81:BO96", col_types = [], col_names = [])

#1. Identify which graphs are relevant to me
  # Chart 9: ARIZONA DEPARTMENT OF CORRECTIONS, REHABILITATION, AND REENTRY ANNUAL COMPLEX EXPENDITURE DETAIL BY FUNCTION
  # Chart 10: ARIZONA DEPARTMENT OF CORRECTIONS, REHABILITATION, AND REENTRY DAILY COMPLEX EXPENDITURE DETAIL BY FUNCTION
  # Chart 11: ARIZONA DEPARTMENT OF CORRECTIONS, REHABILITATION, AND REENTRY ANNUAL COMPLEX EXPENDITURE DETAIL BY OBJECT
  # Chart X: ARIZONA DEPARTMENT OF CORRECTIONS, REHABILITATION, AND REENTRY ANNUAL CUSTODY LEVEL EXPENDITURE DETAIL BY OBJECT
  # If possible, look at charts at the end for additional information on expenditure by year for state (public), in-state contract (private), out-of-state (private)
    # ignore county jails (waiting to be sent to prison) -- bc there is no private alternative to that

# Analysis of Expenses for privates vs public
  # Chart 2: Expense for private vs public prisons. Data within that:
    # A. State Prison Complexes Row 81 to row Row 96 AND First Col to Col 11 (Says Total Expenses)
    # B. Private Prisons Row 97 to Row 109 AND First Col to Col 11 (Says Total Expenses)
      # Add header for this: "Private Prisons", "Custody", "ADP", "Unit Direct", "Complex Direct", "Total Direct", "Total Indirect", "Total Expenses"
        # Might not need the Custody column
    # C. State Prison Annual Per Capita Cost Row 81 to Row 91 AND Col 13 to Col 19
      # Add header for this: "Annual_Per_Capita_Cost_Direct", "Annual_Per_Capita_Cost_Indirect", "Annual_Per_Capita_Cost_Total", "Capita_Cost",  
    # D. Private Prison Annual Per Capita Cost Row 98 to Row 109 AND Col 13 to Col 19
      # Add header for this: "Annual_Per_Capita_Cost_Direct", "Annual_Per_Capita_Cost_Indirect", "Annual_Per_Capita_Cost_Total", "Capita_Cost",  

# Analysis of Health Treatment for Public vs Private 
  # Chart X: STATE PRISON CAPABILITIES FOR MEDICAL, MENTAL HEALTH AND DENTAL TREATMENT SERVICES AS OF January 1, 2020
    
  # Chart X: CONTRACT CRITERIA USED BY IN-STATE PRIVATE PRISON CONTRACTORS IN PROVIDING MEDICAL, MENTAL HEALTH AND DENTAL TREATMENT SERVICES AS OF January 1, 2020 



#2. Extract those graphs 




# In class
# for private prisons they have units listed on page 8
# for state prisosn they have units listen on pages 10-11
# for eda: do a distribution on each variable: 
# do cluster analysis

