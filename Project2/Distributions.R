# Distributions for each variable across private and public
library(ggplot2)
library(tidyverse)
library(scales)

# State Prisons
shorter_dataset <- read_csv("../Project1/data/Processed_Data/State_Prison_Revenue.csv")
shorter_dataset <- shorter_dataset[!grepl("Total", shorter_dataset$`Prison Unit`, ignore.case = TRUE), ] #ignore all rows that include the word Total


p <- ggplot(shorter_dataset, aes(x = `ADP`)) +
  geom_histogram(aes(y = ..density..), bins = 30, fill = "skyblue", color = "black", alpha = 0.6) +
  geom_density(color = "darkblue", size = 1.2) +
  scale_x_continuous(labels = comma) + 
  labs(title = "Distribution of ADP", x = "ADP", y = "Density") +
  theme_minimal()

p

p <- ggplot(shorter_dataset, aes(x = `ADP`)) +
  geom_histogram(bins = 30, fill = "skyblue", color = "black") +
  scale_x_continuous(labels = comma) + 
  labs(title = "Distribution of ADP", x = "ADP", y = "Count")

print(p)

p <- ggplot(shorter_dataset, aes(x = `UNIT DIRECT`)) +
  geom_histogram(bins = 30, fill = "skyblue", color = "black") +
  scale_x_continuous(labels = comma) + 
  labs(title = "Distribution of UNIT DIRECT", x = "UNIT DIRECT", y = "Count")

print(p)

p <- ggplot(shorter_dataset, aes(x = `COMPLEX DIRECT`)) +
  geom_histogram(bins = 30, fill = "skyblue", color = "black") +
  scale_x_continuous(labels = comma) + 
  labs(title = "Distribution of COMPLEX DIRECT", x = "COMPLEX DIRECT", y = "Count")

print(p)

p <- ggplot(shorter_dataset, aes(x = `TOTAL DIRECT`)) +
  geom_histogram(bins = 30, fill = "skyblue", color = "black") +
  scale_x_continuous(labels = comma) + 
  labs(title = "Distribution of TOTAL DIRECT", x = "TOTAL DIRECT", y = "Count")

print(p)

p <- ggplot(shorter_dataset, aes(x = `TOTAL INDIRECT`)) +
  geom_histogram(bins = 30, fill = "skyblue", color = "black") +
  scale_x_continuous(labels = comma) + 
  labs(title = "Distribution of TOTAL INDIRECT", x = "TOTAL INDIRECT", y = "Count")

print(p)

p <- ggplot(shorter_dataset, aes(x = `TOTAL EXPENSE`)) +
  geom_histogram(bins = 30, fill = "skyblue", color = "black") +
  scale_x_continuous(labels = comma) + 
  labs(title = "Distribution of TOTAL EXPENSE", x = "TOTAL EXPENSE", y = "Count")

print(p)

p <- ggplot(shorter_dataset, aes(x = `Annual Per Capita Cost - Direct`)) +
  geom_histogram(bins = 30, fill = "skyblue", color = "black") +
  scale_x_continuous(labels = comma) + 
  labs(title = "Distribution of Annual Per Capita Cost - Direct", x = "Annual Per Capita Cost - Direct", y = "Count")

print(p)

p <- ggplot(shorter_dataset, aes(x = `Annual Per Capita Cost - Indirect`)) +
  geom_histogram(bins = 30, fill = "skyblue", color = "black") +
  scale_x_continuous(labels = comma) + 
  labs(title = "Distribution of Annual Per Capita Cost - Indirect", x = "Annual Per Capita Cost - Indirect", y = "Count")

print(p)

p <- ggplot(shorter_dataset, aes(x = `Annual Per Capita Cost - Total`)) +
  geom_histogram(bins = 30, fill = "skyblue", color = "black") +
  scale_x_continuous(labels = comma) + 
  labs(title = "Distribution of Annual Per Capita Cost - Total", x = "Annual Per Capita Cost - Total", y = "Count")

print(p)


p <- ggplot(shorter_dataset, aes(x = `Daily Per Capita Cost`)) +
  geom_histogram(bins = 30, fill = "skyblue", color = "black") +
  scale_x_continuous(labels = comma) + 
  labs(title = "Distribution of Daily Per Capita Cost", x = "Daily Per Capita Cost", y = "Count")

print(p)

# Private Prisons
private_dataset <- read_csv("../Project1/data/Processed_Data/Private_Prison_Revenue.csv")
private_dataset <- shorter_dataset[!grepl("Total", shorter_dataset$`Prison Unit`, ignore.case = TRUE), ] #ignore all rows that include the word Total

shorter_dataset$group <- "All"
private_dataset$group <- "Private"

combined_data <- rbind(shorter_dataset, private_dataset)


p <- ggplot(combined_data, aes(x = `ADP`, fill = group)) +
  geom_histogram(bins = 30, color = "black", position = "identity", alpha = 0.5) +
  scale_x_continuous(labels = comma) + 
  labs(title = "Distribution of ADP (All vs Private)", x = "ADP", y = "Count") +
  scale_fill_manual(values = c("black", "orange")) +
  theme_minimal()

p

p <- ggplot(shorter_dataset, aes(x = `ADP`)) +
  geom_histogram(bins = 30, fill = "skyblue", color = "black") +
  scale_x_continuous(labels = comma) + 
  labs(title = "Private Prison: Distribution of ADP", x = "ADP", y = "Count")

print(p)

p <- ggplot(shorter_dataset, aes(x = `UNIT DIRECT`)) +
  geom_histogram(bins = 30, fill = "skyblue", color = "black") +
  scale_x_continuous(labels = comma) + 
  labs(title = "Private Prison: Distribution of UNIT DIRECT", x = "UNIT DIRECT", y = "Count")

print(p)

p <- ggplot(shorter_dataset, aes(x = `COMPLEX DIRECT`)) +
  geom_histogram(bins = 30, fill = "skyblue", color = "black") +
  scale_x_continuous(labels = comma) + 
  labs(title = "Private Prison: Distribution of COMPLEX DIRECT", x = "COMPLEX DIRECT", y = "Count")

print(p)

p <- ggplot(shorter_dataset, aes(x = `TOTAL DIRECT`)) +
  geom_histogram(bins = 30, fill = "skyblue", color = "black") +
  scale_x_continuous(labels = comma) + 
  labs(title = "Private Prison: Distribution of TOTAL DIRECT", x = "TOTAL DIRECT", y = "Count")

print(p)

p <- ggplot(shorter_dataset, aes(x = `TOTAL INDIRECT`)) +
  geom_histogram(bins = 30, fill = "skyblue", color = "black") +
  scale_x_continuous(labels = comma) + 
  labs(title = "Private Prison: Distribution of TOTAL INDIRECT", x = "TOTAL INDIRECT", y = "Count")

print(p)

p <- ggplot(shorter_dataset, aes(x = `TOTAL EXPENSE`)) +
  geom_histogram(bins = 30, fill = "skyblue", color = "black") +
  scale_x_continuous(labels = comma) + 
  labs(title = "Private Prison: Distribution of TOTAL EXPENSE", x = "TOTAL EXPENSE", y = "Count")

print(p)

p <- ggplot(shorter_dataset, aes(x = `Annual Per Capita Cost - Direct`)) +
  geom_histogram(bins = 30, fill = "skyblue", color = "black") +
  scale_x_continuous(labels = comma) + 
  labs(title = "Private Prison: Distribution of Annual Per Capita Cost - Direct", x = "Annual Per Capita Cost - Direct", y = "Count")

print(p)

p <- ggplot(shorter_dataset, aes(x = `Annual Per Capita Cost - Indirect`)) +
  geom_histogram(bins = 30, fill = "skyblue", color = "black") +
  scale_x_continuous(labels = comma) + 
  labs(title = "Private Prison: Distribution of Annual Per Capita Cost - Indirect", x = "Annual Per Capita Cost - Indirect", y = "Count")

print(p)

p <- ggplot(shorter_dataset, aes(x = `Annual Per Capita Cost - Total`)) +
  geom_histogram(bins = 30, fill = "skyblue", color = "black") +
  scale_x_continuous(labels = comma) + 
  labs(title = "Private Prison: Distribution of Annual Per Capita Cost - Total", x = "Annual Per Capita Cost - Total", y = "Count")

print(p)


p <- ggplot(shorter_dataset, aes(x = `Daily Per Capita Cost`)) +
  geom_histogram(bins = 30, fill = "skyblue", color = "black") +
  scale_x_continuous(labels = comma) + 
  labs(title = "Private Prison: Distribution of Daily Per Capita Cost", x = "Daily Per Capita Cost", y = "Count")

print(p)

#Private_Prison_ADP_Distribution.png

