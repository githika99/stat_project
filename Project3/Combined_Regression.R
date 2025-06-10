install.packages(c("aod", "ggplot2", "tidyverse"))
library(aod)
library(ggplot2)
# Install necessary packages if not already installed
# install.packages(c("tidyverse"))

# Load libraries
library(tidyverse)

# --- Load and label datasets ---
state_dataset <- read_csv("./Project1/data/Processed_Data/State_Prison_Revenue.csv") %>%
  filter(!grepl("Total", `Prison Unit`, ignore.case = TRUE)) %>%
  mutate(Type = "State")

private_dataset <- read_csv("./Project1/data/Processed_Data/Private_Prison_Revenue.csv") %>%
  filter(!grepl("Total", `Prison Unit`, ignore.case = TRUE)) %>%
  mutate(Type = "Private")

# --- Combine datasets ---
combined_data <- bind_rows(state_dataset, private_dataset)

# Rename columns to remove spaces for easier handling in ggplot
combined_data <- combined_data %>%
  rename(
    Annual_Per_Capita_Cost_Direct = `Annual Per Capita Cost - Direct`,
    Annual_Per_Capita_Cost_Indirect = `Annual Per Capita Cost - Indirect`
  )

# Create binary outcome: 1 = Private, 0 = State
combined_data <- combined_data %>%
  mutate(PrivateBinary = ifelse(Type == "Private", 1, 0))

# --- Logistic Regression: Direct Cost Only ---
model_direct <- glm(PrivateBinary ~ Annual_Per_Capita_Cost_Direct, 
                    data = combined_data, 
                    family = "binomial")

# Predict probabilities across range of direct costs
cost_direct_seq <- seq(min(combined_data$Annual_Per_Capita_Cost_Direct),
                       max(combined_data$Annual_Per_Capita_Cost_Direct), 
                       length.out = 100)

direct_plot_df <- data.frame(Annual_Per_Capita_Cost_Direct = cost_direct_seq)
direct_plot_df$prob <- predict(model_direct, newdata = direct_plot_df, type = "response")

# --- Logistic Regression: Indirect Cost Only ---
model_indirectADP <- glm(PrivateBinary ~ ADP, 
                      data = combined_data, 
                      family = "binomial")

# Predict probabilities across range of indirect costs
cost_indirect_seq <- seq(min(combined_data$Annual_Per_Capita_Cost_Indirect),
                         max(combined_data$Annual_Per_Capita_Cost_Indirect), 
                         length.out = 100)

indirect_plot_df <- data.frame(Annual_Per_Capita_Cost_Indirect = cost_indirect_seq)
indirect_plot_df$prob <- predict(model_indirect, newdata = indirect_plot_df, type = "response")

# --- Plot for Direct Cost ---
ggplot() +
  geom_point(data = combined_data,
             aes(x = Annual_Per_Capita_Cost_Direct, y = PrivateBinary, color = Type),
             alpha = 0.6) +
  geom_line(data = direct_plot_df,
            aes(x = Annual_Per_Capita_Cost_Direct, y = prob),
            color = "black", linewidth = 1.2) +
  labs(title = "Probability of Private Prison by Direct Cost",
       x = "Annual Per Capita Cost - Direct",
       y = "Predicted Probability of Being Private") +
  theme_minimal()

# --- Plot for Indirect Cost ---
ggplot() +
  geom_point(data = combined_data,
             aes(x = Annual_Per_Capita_Cost_Indirect, y = PrivateBinary, color = Type),
             alpha = 0.6) +
  geom_line(data = indirect_plot_df,
            aes(x = Annual_Per_Capita_Cost_Indirect, y = prob),
            color = "black", linewidth = 1.2) +
  labs(title = "Probability of Private Prison by Indirect Cost",
       x = "Annual Per Capita Cost - Indirect",
       y = "Predicted Probability of Being Private") +
  theme_minimal()

summary(model_direct)
summary(model_indirect)

