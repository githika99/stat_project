library(readxl)
library(tidyverse)
library(naniar)
library(superheat)
library(patchwork)
library(dplyr)

Data_gfg <- read_excel("Arizona_Department_of_Corrections_Cost_Report_2020.xlsx", col_types = "text")

Data_gfg_clean <- Data_gfg[, colSums(!is.na(Data_gfg) & Data_gfg != "") > 0] # remove empty columns

Data_gfg_clean

# read from fields A97:CU109 -> private prisons
shorter_dataset <- read_excel(
  "./Project1/data/Raw_Data/Arizona_Department_of_Corrections_Cost_Report_2020.xlsx",
  range = "A97:CU109",
  col_names = TRUE
)

shorter_dataset <- shorter_dataset[, colSums(!is.na(shorter_dataset) & shorter_dataset != "") > 0] # remove empty columns

colnames(shorter_dataset) <- c("Prison Unit", "Custody", "ADP", "UNIT DIRECT", "COMPLEX DIRECT", "TOTAL DIRECT","TOTAL INDIRECT", "TOTAL EXPENSE", "Annual Per Capita Cost - Direct", "Annual Per Capita Cost - Indirect", "Annual Per Capita Cost - Total", "Daily Per Capita Cost")

shorter_dataset[c(6, 10), "Prison Unit"] <- c("Total Min Custody", "Total Med Custody")

shorter_dataset <- shorter_dataset[-11, ] #remove row 12

#rename to include custody name in prison unit column
shorter_dataset$`Prison Unit` <- ifelse(
  is.na(shorter_dataset$Custody),
  shorter_dataset$`Prison Unit`,
  paste0(shorter_dataset$`Prison Unit`, " - ", shorter_dataset$Custody)
)

# remove custody col
shorter_dataset$Custody <- NULL

# Convert all columns except 'Prison Unit' to numeric (if needed)
shorter_dataset <- shorter_dataset %>%
  mutate(across(-`Prison Unit`, ~ as.numeric(.)))

write_csv(shorter_dataset, "Private_Prison_Revenue.csv")


# read from A129:CT202
shorter_dataset <- read_excel(
  "./Project1/data/Raw_Data/Arizona_Department_of_Corrections_Cost_Report_2020.xlsx",
  range = "A129:CT202",
  col_names = TRUE
)

shorter_dataset <- shorter_dataset[, colSums(!is.na(shorter_dataset) & shorter_dataset != "") > 0] # remove empty columns

colnames(shorter_dataset) <- c("Prison Unit", "Custody", "ADP", "UNIT DIRECT", "COMPLEX DIRECT", "TOTAL DIRECT","TOTAL INDIRECT", "TOTAL EXPENSE", "Annual Per Capita Cost - Direct", "Annual Per Capita Cost - Indirect", "Annual Per Capita Cost - Total", "Daily Per Capita Cost")

#renaming column prison unit for ones that have the complex name already
shorter_dataset[c(16, 34), "Prison Unit"] <- c("Central", "Lumley")

# adding complex name to prison unit column
shorter_dataset$`Prison Unit`[c(1,2,3,4,5)] <- paste0("ASPC-DOUGLAS - ", shorter_dataset$`Prison Unit`[c(1,2,3,4,5)])
shorter_dataset$`Prison Unit`[c(7,8,9,10,11,12,13,14,15)] <- paste0("ASPC-EYMAN - ", shorter_dataset$`Prison Unit`[c(7,8,9,10,11,12,13,14,15)])
shorter_dataset$`Prison Unit`[c(16,17,18,19,20,21,22)] <- paste0("ASPC-FLORENCE - ", shorter_dataset$`Prison Unit`[c(16,17,18,19,20,21,22)])
shorter_dataset$`Prison Unit`[c(24,25,26,27,28,29,30,31,32,33)] <- paste0("ASPC-LEWIS - ", shorter_dataset$`Prison Unit`[c(24,25,26,27,28,29,30,31,32,33)])
shorter_dataset$`Prison Unit`[c(34, 35, 36, 37, 38, 39, 40, 41, 42,43)] <- paste0("ASPC-PERRYVILLE - ", shorter_dataset$`Prison Unit`[c(34, 35, 36, 37, 38, 39, 40, 41, 42,43)])
shorter_dataset$`Prison Unit`[c(47,48,49,50)] <- paste0("ASPC-SAFFORD - ", shorter_dataset$`Prison Unit`[c(47,48,49,50)])
shorter_dataset$`Prison Unit`[c(52,53,54,55,56,57,58,59,60)] <- paste0("ASPC-TUCSON - ", shorter_dataset$`Prison Unit`[c(52,53,54,55,56,57,58,59,60)])
shorter_dataset$`Prison Unit`[c(62,63,64,65)] <- paste0("ASPC-WINSLOW - ", shorter_dataset$`Prison Unit`[c(62,63,64,65)])
shorter_dataset$`Prison Unit`[c(67,68,69,70,71,72)] <- paste0("ASPC-YUMA - ", shorter_dataset$`Prison Unit`[c(67,68,69,70,71,72)])

#replace text NA to logical NA in Custody col
shorter_dataset$Custody[shorter_dataset$Custody == "NA"] <- NA

#rename to include custody name in prison unit column
shorter_dataset$`Prison Unit` <- ifelse(
  is.na(shorter_dataset$Custody),
  shorter_dataset$`Prison Unit`,
  paste0(shorter_dataset$`Prison Unit`, " - ", shorter_dataset$Custody)
)

# remove custody col
shorter_dataset$Custody <- NULL

# lines with same unit name (different custody levels)
# Lumely
# 39, 40 - ASPC-PERRYVILLE - Santa Cruz
# 24, 25 - ASPC-LEWIS - Bachman
# 13, 14 - ASPC-EYMAN - SMU I
# 10, 11 - ASPC-EYMAN - Meadows
# 7, 8 - ASPC-EYMAN - Browning 
# Rast
# Central

shorter_dataset <- shorter_dataset[-c(6, 23, 28, 44, 45, 46, 51, 61, 66), ] #remove rows that just had Units, no information

# remove row that had empty information (ASPC - LEWIS: Morey) (Line 28)

# Convert all columns except 'Prison Unit' to numeric (if needed)
shorter_dataset <- shorter_dataset %>%
  mutate(across(-`Prison Unit`, ~ as.numeric(.)))

write_csv(shorter_dataset, "State_Prison_Revenue.csv")

# delete row in the middle 



"""
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
    "CUSTODY", "ADP", "BLANK1", "UNIT DIRECT", "COMPLEX DIRECT", "BLANK2",
    "TOTAL DIRECT", "BLANK3", "BLANK4", "TOTAL INDIRECT", "BLANK5", "BLANK6", "TOTAL EXPENSE"
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
"""

