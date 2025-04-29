# Distributions for each variable across private and public
library(ggplot2)
library(scales)

# State Prisons
shorter_dataset <- read_csv("./Project1/data/Processed_Data/State_Prison_Revenue.csv")
shorter_dataset <- shorter_dataset[!grepl("Total", shorter_dataset$`Prison Unit`, ignore.case = TRUE), ] #ignore all rows that include the word Total


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
shorter_dataset <- read_csv("./Project1/data/Processed_Data/Private_Prison_Revenue.csv")
shorter_dataset <- shorter_dataset[!grepl("Total", shorter_dataset$`Prison Unit`, ignore.case = TRUE), ] #ignore all rows that include the word Total

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

