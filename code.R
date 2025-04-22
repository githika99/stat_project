
library(tidyverse)
library(naniar)
library(superheat)
library(patchwork)

# Step 1: Read and clean data
data_original <- read_csv("Arizona_Department_of_Correction_Inmate_Fact_Sheet_2020.csv")
data <- data_original[, apply(data_original, 2, function(x) sum(!is.na(x)) > 0)]
write.csv(data, "data_no_empty_cols.csv", row.names = FALSE)

# Step 2: Read raw lines from the cleaned CSV
x <- readLines("data_no_empty_cols.csv")

# Step 3: Locate the target section
start_index <- grep("Admissions, Releases, Confined - History", x)

# Step 4: Replace header row
new_header <- paste(c("Total_Population",
                      "Admissions_Male", "Admissions_Female", "Admissions_Total",
                      "Releases_Male", "Releases_Female", "Releases_Total",
                      "End_of_Fiscal_Year_Confined_Population_Male",
                      "End_of_Fiscal_Year_Confined_Population_Female",
                      "End_of_Fiscal_Year_Confined_Population_Total"), collapse = ",")

# Step 5: Extract the 13 lines (header + 12 rows)
tmp <- x[start_index + 0:12]
tmp <- tmp[, apply(tmp, 2, function(x) sum(!is.na(x)) > 0)] # get rid of empty cols
tmp[1] <- new_header  # replace the original header

# Step 6: Write to file
writeLines(tmp, "Total_Population.csv")

# 2. Average Length of Stay (Years)  for Prisoners Admitted (2009-2020)

# add header names
# colnames(test) <- c("Average_Length_of_Stay_(Years)","Admissions_Male", "Admissions_Female", "Admissions_Total", "Releases_Male", "Releases_Female", "Releases_Total", "End_of_Fiscal_Year_Confined_Population_Male", "End_of_Fiscal_Year_Confined_Population_Female", "End_of_Fiscal_Year_Confined_Population_Total")


# 3. Median Length of Stay (Years) for Prisoners Admitted (2009-2020)

# add header names
# colnames(test) <- c("Median_Length_of_Stay_(Years)","Admissions_Male", "Admissions_Female", "Admissions_Total", "Releases_Male", "Releases_Female", "Releases_Total", "End_of_Fiscal_Year_Confined_Population_Male", "End_of_Fiscal_Year_Confined_Population_Female", "End_of_Fiscal_Year_Confined_Population_Total")

file.remove('data_no_empty_cols.csv') 





