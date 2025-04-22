
library(tidyverse)
library(naniar)
library(superheat)
library(patchwork)

# Step 1: Read and clean data
data_original <- read_csv("./Project1/data/Raw_Data/Arizona_Department_of_Correction_Inmate_Fact_Sheet_2020.csv")
data <- data_original[, apply(data_original, 2, function(x) sum(!is.na(x)) > 0)]
write.csv(data, "data_no_empty_cols.csv", row.names = FALSE)
x <- readLines("data_no_empty_cols.csv")

# 1. For Total Population
tmp <- x[ grep("Admissions, Releases, Confined - History", x) + 0:12 ]
write(tmp, "Total_Population.csv")
tmp_df <- read_csv("Total_Population.csv")
tmp_df_clean <- tmp_df[, colSums(!is.na(tmp_df) & tmp_df != "") > 0]
colnames(tmp_df_clean) <- c("Total_Population",
                            "Admissions_Male", "Admissions_Female", "Admissions_Total",
                            "Releases_Male", "Releases_Female", "Releases_Total",
                            "End_of_Fiscal_Year_Confined_Population_Male",
                            "End_of_Fiscal_Year_Confined_Population_Female",
                            "End_of_Fiscal_Year_Confined_Population_Total")
write_csv(tmp_df_clean, "Total_Population.csv")

grep("Median Length of Stay (Years) - History", x)
grepl("Median", x, ignore.case = TRUE)


# 2. Average Length of Stay (Years)  for Prisoners Admitted (2009-2020)
tmp1 <- x[ grep("Average.*Length.*Stay", x, ignore.case = TRUE) + 1:12 ]
write(tmp1, "Average_Length_of_Stay.csv")
tmp_df1 <- read_csv("Average_Length_of_Stay.csv", col_names = FALSE)
tmp_df_clean1 <- tmp_df1[, colSums(!is.na(tmp_df1) & tmp_df1 != "") > 0]
colnames(tmp_df_clean1) <- c("Average_Length_of_Stay_(Years)",
                            "Admissions_Male", "Admissions_Female", "Admissions_Total",
                            "Releases_Male", "Releases_Female", "Releases_Total",
                            "End_of_Fiscal_Year_Confined_Population_Male",
                            "End_of_Fiscal_Year_Confined_Population_Female",
                            "End_of_Fiscal_Year_Confined_Population_Total")
write_csv(tmp_df_clean1, "Average_Length_of_Stay.csv")

# 3. Median Length of Stay (Years) for Prisoners Admitted (2009-2020)
grep("Median.*Length.*Stay", x, ignore.case = TRUE)
tmp <- x[ grep("Median.*Length.*Stay", x, ignore.case = TRUE) + 0:12 ]
write(tmp, "Median_Length_of_Stay.csv")
tmp_df <- read_csv("Median_Length_of_Stay.csv")
tmp_df_clean <- tmp_df[, colSums(!is.na(tmp_df) & tmp_df != "") > 0]
colnames(tmp_df_clean) <- c("Median_Length_of_Stay_(Years)",
                            "Admissions_Male", "Admissions_Female", "Admissions_Total",
                            "Releases_Male", "Releases_Female", "Releases_Total",
                            "End_of_Fiscal_Year_Confined_Population_Male",
                            "End_of_Fiscal_Year_Confined_Population_Female",
                            "End_of_Fiscal_Year_Confined_Population_Total")
write_csv(tmp_df_clean, "Median_Length_of_Stay.csv")


# 4. Average Age Distribution
grep("Age.*Distribution.*#", x, ignore.case = TRUE)
tmp <- x[ grep("Age.*Distribution.*#", x, ignore.case = TRUE) + 0:6 ]
write(tmp, "Average_Age_Distribution.csv")
tmp_df <- read_csv("Average_Age_Distribution.csv")
tmp_df_clean <- tmp_df[, colSums(!is.na(tmp_df) & tmp_df != "") > 0]
colnames(tmp_df_clean) <- c("Average_Age_Distribution",
                            "Admissions_2020_Male", "Admissions_2020_Female", "Admissions_2020_Total",
                            "Releases_2020_Male", "Releases_2020_Female", "Releases_2020_Total",
                            "End_of_Fiscal_Year_2020_Confined_Population_Male",
                            "End_of_Fiscal_Year_2020_Confined_Population_Female",
                            "End_of_Fiscal_Year_2020_Confined_Population_Total")
write_csv(tmp_df_clean, "Average_Age_Distribution.csv")

# 5. Felony History
first_index <- grep("Felony.*History.*#", x, ignore.case = TRUE)[1]
tmp <- x[first_index + 0:3]
write(tmp, "Felony_History.csv")
tmp_df <- read_csv("Felony_History.csv")
tmp_df_clean <- tmp_df[, colSums(!is.na(tmp_df) & tmp_df != "") > 0]
colnames(tmp_df_clean) <- c("Felony_History",
                            "Admissions_2020_Male", "Admissions_2020_Female", "Admissions_2020_Total",
                            "Releases_2020_Male", "Releases_2020_Female", "Releases_2020_Total",
                            "End_of_Fiscal_Year_2020_Confined_Population_Male",
                            "End_of_Fiscal_Year_2020_Confined_Population_Female",
                            "End_of_Fiscal_Year_2020_Confined_Population_Total")
write_csv(tmp_df_clean, "Felony_History.csv")

# 6. Prison History
grep("Prison.*History.*#", x, ignore.case = TRUE)
tmp <- x[ grep("Prison.*History.*#", x, ignore.case = TRUE) + 0:3 ]
write(tmp, "Prison_History.csv")
tmp_df <- read_csv("Prison_History.csv")
tmp_df_clean <- tmp_df[, colSums(!is.na(tmp_df) & tmp_df != "") > 0]
colnames(tmp_df_clean) <- c("Prison_History",
                            "Admissions_2020_Male", "Admissions_2020_Female", "Admissions_2020_Total",
                            "Releases_2020_Male", "Releases_2020_Female", "Releases_2020_Total",
                            "End_of_Fiscal_Year_2020_Confined_Population_Male",
                            "End_of_Fiscal_Year_2020_Confined_Population_Female",
                            "End_of_Fiscal_Year_2020_Confined_Population_Total")
write_csv(tmp_df_clean, "Prison_History.csv")

# 7. Criminal History
grep("Criminal.*History.*#", x, ignore.case = TRUE)
tmp <- x[ grep("Criminal.*History.*#", x, ignore.case = TRUE) + 0:4 ]
write(tmp, "Criminal_History.csv")
tmp_df <- read_csv("Criminal_History.csv")
tmp_df_clean <- tmp_df[, colSums(!is.na(tmp_df) & tmp_df != "") > 0]
colnames(tmp_df_clean) <- c("Criminal_History",
                            "Admissions_2020_Male", "Admissions_2020_Female", "Admissions_2020_Total",
                            "Releases_2020_Male", "Releases_2020_Female", "Releases_2020_Total",
                            "End_of_Fiscal_Year_2020_Confined_Population_Male",
                            "End_of_Fiscal_Year_2020_Confined_Population_Female",
                            "End_of_Fiscal_Year_2020_Confined_Population_Total")
write_csv(tmp_df_clean, "Criminal_History.csv")


# 7. Felony Class
grep("* Felony.*Class.*#", x, ignore.case = TRUE)
tmp <- x[ grep("* Felony.*Class.*#", x, ignore.case = TRUE) + 0:7 ]
write(tmp, "Felony_Class.csv")
tmp_df <- read_csv("Felony_Class.csv")
tmp_df_clean <- tmp_df[, colSums(!is.na(tmp_df) & tmp_df != "") > 0]
colnames(tmp_df_clean) <- c("Felony_Class",
                            "Admissions_2020_Male", "Admissions_2020_Female", "Admissions_2020_Total",
                            "Releases_2020_Male", "Releases_2020_Female", "Releases_2020_Total",
                            "End_of_Fiscal_Year_2020_Confined_Population_Male",
                            "End_of_Fiscal_Year_2020_Confined_Population_Female",
                            "End_of_Fiscal_Year_2020_Confined_Population_Total")
write_csv(tmp_df_clean, "Felony_Class.csv")

# 8. Admit Type
grep("Admit.*Type.*#", x, ignore.case = TRUE)
tmp <- x[ grep("Admit.*Type.*#", x, ignore.case = TRUE) + 0:5 ]
write(tmp, "Admit_Type.csv")
tmp_df <- read_csv("Admit_Type.csv")
tmp_df_clean <- tmp_df[, colSums(!is.na(tmp_df) & tmp_df != "") > 0]
colnames(tmp_df_clean) <- c("Admit_Type",
                            "Admissions_2020_Male", "Admissions_2020_Female", "Admissions_2020_Total",
                            "Releases_2020_Male", "Releases_2020_Female", "Releases_2020_Total",
                            "End_of_Fiscal_Year_2020_Confined_Population_Male",
                            "End_of_Fiscal_Year_2020_Confined_Population_Female",
                            "End_of_Fiscal_Year_2020_Confined_Population_Total")
write_csv(tmp_df_clean, "Admit_Type.csv")

# 9. Citizenship
grep("* Citizenship.*#", x, ignore.case = TRUE)
tmp <- x[ grep("* Citizenship.*#", x, ignore.case = TRUE) + 0:3 ]
write(tmp, "Citizenship.csv")
tmp_df <- read_csv("Citizenship.csv")
tmp_df_clean <- tmp_df[, colSums(!is.na(tmp_df) & tmp_df != "") > 0]
colnames(tmp_df_clean) <- c("Citizenship",
                            "Admissions_2020_Male", "Admissions_2020_Female", "Admissions_2020_Total",
                            "Releases_2020_Male", "Releases_2020_Female", "Releases_2020_Total",
                            "End_of_Fiscal_Year_2020_Confined_Population_Male",
                            "End_of_Fiscal_Year_2020_Confined_Population_Female",
                            "End_of_Fiscal_Year_2020_Confined_Population_Total")
write_csv(tmp_df_clean, "Citizenship.csv")

# 10. Substance Abuse History
grep("* Substance.*Abuse.*History.*#", x, ignore.case = TRUE)
tmp <- x[ grep("* Substance.*Abuse.*History.*#", x, ignore.case = TRUE) + 0:5 ]
write(tmp, "Substance_Abuse_History.csv")
tmp_df <- read_csv("Substance_Abuse_History.csv")
tmp_df_clean <- tmp_df[, colSums(!is.na(tmp_df) & tmp_df != "") > 0]
colnames(tmp_df_clean) <- c("Substance_Abuse_History",
                            "Admissions_2020_Male", "Admissions_2020_Female", "Admissions_2020_Total",
                            "Releases_2020_Male", "Releases_2020_Female", "Releases_2020_Total",
                            "End_of_Fiscal_Year_2020_Confined_Population_Male",
                            "End_of_Fiscal_Year_2020_Confined_Population_Female",
                            "End_of_Fiscal_Year_2020_Confined_Population_Total")
write_csv(tmp_df_clean, "Substance_Abuse_History.csv")

# 11. Gang Affiliation
grep("Gang.*Affiliation.*#.*STG", x, ignore.case = TRUE)
tmp <- x[ grep("Gang.*Affiliation.*#.*STG", x, ignore.case = TRUE) + 0:3 ]
write(tmp, "Gang_Affiliation.csv")
tmp_df <- read_csv("Gang_Affiliation.csv")
tmp_df_clean <- tmp_df[, colSums(!is.na(tmp_df) & tmp_df != "") > 0]
colnames(tmp_df_clean) <- c("Gang_Affiliation",
                            "Admissions_2020_Male", "Admissions_2020_Female", "Admissions_2020_Total",
                            "Releases_2020_Male", "Releases_2020_Female", "Releases_2020_Total",
                            "End_of_Fiscal_Year_2020_Confined_Population_Male",
                            "End_of_Fiscal_Year_2020_Confined_Population_Female",
                            "End_of_Fiscal_Year_2020_Confined_Population_Total")
write_csv(tmp_df_clean, "Gang_Affiliation.csv")

# 11. Sex Offender
grep("Sex.*Offender.*#", x, ignore.case = TRUE)
tmp <- x[ grep("Sex.*Offender.*#", x, ignore.case = TRUE) + 0:3 ]
write(tmp, "Sex_Offender.csv")
tmp_df <- read_csv("Sex_Offender.csv")
tmp_df_clean <- tmp_df[, colSums(!is.na(tmp_df) & tmp_df != "") > 0]
colnames(tmp_df_clean) <- c("Sex_Offender",
                            "Admissions_2020_Male", "Admissions_2020_Female", "Admissions_2020_Total",
                            "Releases_2020_Male", "Releases_2020_Female", "Releases_2020_Total",
                            "End_of_Fiscal_Year_2020_Confined_Population_Male",
                            "End_of_Fiscal_Year_2020_Confined_Population_Female",
                            "End_of_Fiscal_Year_2020_Confined_Population_Total")
write_csv(tmp_df_clean, "Sex_Offender.csv")


# 11. Mental Health
grep("* Mental.*Health.*#", x, ignore.case = TRUE)
tmp <- x[ grep("* Mental.*Health.*#", x, ignore.case = TRUE) + 0:6 ]
write(tmp, "Mental_Health.csv")
tmp_df <- read_csv("Mental_Health.csv")
tmp_df_clean <- tmp_df[, colSums(!is.na(tmp_df) & tmp_df != "") > 0]
colnames(tmp_df_clean) <- c("Mental_Health",
                            "Admissions_2020_Male", "Admissions_2020_Female", "Admissions_2020_Total",
                            "Releases_2020_Male", "Releases_2020_Female", "Releases_2020_Total",
                            "End_of_Fiscal_Year_2020_Confined_Population_Male",
                            "End_of_Fiscal_Year_2020_Confined_Population_Female",
                            "End_of_Fiscal_Year_2020_Confined_Population_Total")
write_csv(tmp_df_clean, "Mental_Health.csv")


# 11. Medical Score
grep("* Medical.*Score.*#", x, ignore.case = TRUE)
tmp <- x[ grep("* Medical.*Score.*#", x, ignore.case = TRUE) + 0:11 ]
write(tmp, "Medical_Score.csv")
tmp_df <- read_csv("Medical_Score.csv")
tmp_df_clean <- tmp_df[, colSums(!is.na(tmp_df) & tmp_df != "") > 0]
colnames(tmp_df_clean) <- c("Medical_Score",
                            "Admissions_2020_Male", "Admissions_2020_Female", "Admissions_2020_Total",
                            "Releases_2020_Male", "Releases_2020_Female", "Releases_2020_Total",
                            "End_of_Fiscal_Year_2020_Confined_Population_Male",
                            "End_of_Fiscal_Year_2020_Confined_Population_Female",
                            "End_of_Fiscal_Year_2020_Confined_Population_Total")
write_csv(tmp_df_clean, "Medical_Score.csv")

# 11. Inmate Commitment Offenses
grep("Inmate.*Commitment.*Offenses.*#", x, ignore.case = TRUE)
tmp <- x[ grep("Inmate.*Commitment.*Offenses.*#", x, ignore.case = TRUE) + 0:29 ]
write(tmp, "Inmate_Commitment_Offenses.csv")
tmp_df <- read_csv("Inmate_Commitment_Offenses.csv")
tmp_df_clean <- tmp_df[, colSums(!is.na(tmp_df) & tmp_df != "") > 0]
# Additional Step: Delete rows with non numeric values
numeric_only <- tmp_df_clean %>%
  filter(apply(.[-1], 1, function(row) all(str_detect(row, "^\\d+(\\.\\d+)?$"))))
colnames(tmp_df_clean) <- c("Inmate_Commitment_Offenses",
                            "Admissions_2020_Male", "Admissions_2020_Female", "Admissions_2020_Total",
                            "Releases_2020_Male", "Releases_2020_Female", "Releases_2020_Total",
                            "End_of_Fiscal_Year_2020_Confined_Population_Male",
                            "End_of_Fiscal_Year_2020_Confined_Population_Female",
                            "End_of_Fiscal_Year_2020_Confined_Population_Total")
write_csv(tmp_df_clean, "Inmate_Commitment_Offenses.csv")

# Remove Unnecessary File at End
file.remove('data_no_empty_cols.csv') 

# LEFT OFF: Delete rows with non numeric values for Inmate Commitment Offenses Only





