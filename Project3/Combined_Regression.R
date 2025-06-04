install.packages(c("aod", "ggplot2", "tidyverse"))
library(aod)
library(ggplot2)
library(tidyverse)


# Load and process state dataset
state_dataset <- read_csv("./Project1/data/Processed_Data/State_Prison_Revenue.csv") %>%
  filter(!grepl("Total", `Prison Unit`, ignore.case = TRUE)) %>%
  mutate(Type = "State")

# Load and process private dataset
private_dataset <- read_csv("./Project1/data/Processed_Data/Private_Prison_Revenue.csv") %>%
  filter(!grepl("Total", `Prison Unit`, ignore.case = TRUE)) %>%
  mutate(Type = "Private")

# Combine the datasets
combined_data <- bind_rows(state_dataset, private_dataset)
head(combined_data)



# trying again
combined_data$PrivateBinary <- ifelse(combined_data$Type == "Private", 1, 0)

# Model 1: Using Annual Per Capita Cost - Direct
model_direct <- glm(PrivateBinary ~ `Annual Per Capita Cost - Direct`, 
                    data = combined_data, 
                    family = "binomial")

# Model 2: Using Annual Per Capita Cost - Indirect
model_indirect <- glm(PrivateBinary ~ `Annual Per Capita Cost - Indirect`, 
                      data = combined_data, 
                      family = "binomial")
# Direct cost grid
cost_direct_seq <- seq(min(combined_data$`Annual Per Capita Cost - Direct`),
                       max(combined_data$`Annual Per Capita Cost - Direct`), 
                       length.out = 100)
pred_direct <- predict(model_direct, 
                       newdata = data.frame(`Annual Per Capita Cost - Direct` = cost_direct_seq), 
                       type = "response")

direct_plot_df <- data.frame(
  `Annual Per Capita Cost - Direct` = cost_direct_seq,
  prob = pred_direct
)

# Indirect cost grid
cost_indirect_seq <- seq(min(combined_data$`Annual Per Capita Cost - Indirect`),
                         max(combined_data$`Annual Per Capita Cost - Indirect`), 
                         length.out = 100)
pred_indirect <- predict(model_indirect, 
                         newdata = data.frame(`Annual Per Capita Cost - Indirect` = cost_indirect_seq), 
                         type = "response")

indirect_plot_df <- data.frame(
  `Annual Per Capita Cost - Indirect` = cost_indirect_seq,
  prob = pred_indirect
)

library(ggplot2)

ggplot() +
  geom_point(data = combined_data,
             aes(x = `Annual Per Capita Cost - Direct`, y = PrivateBinary, color = Type),
             alpha = 0.6) +
  geom_line(data = direct_plot_df,
            aes(x = `Annual Per Capita Cost - Direct`, y = prob),
            color = "black", size = 1.2) +
  labs(title = "Probability of Private Prison by Direct Cost",
       x = "Annual Per Capita Cost - Direct",
       y = "Predicted Probability of Being Private") +
  theme_minimal()

ggplot() +
  geom_point(data = combined_data,
             aes(x = `Annual Per Capita Cost - Indirect`, y = PrivateBinary, color = Type),
             alpha = 0.6) +
  geom_line(data = indirect_plot_df,
            aes(x = `Annual Per Capita Cost - Indirect`, y = prob),
            color = "black", size = 1.2) +
  labs(title = "Probability of Private Prison by Indirect Cost",
       x = "Annual Per Capita Cost - Indirect",
       y = "Predicted Probability of Being Private") +
  theme_minimal()

"""

combined_data$Type <- factor(combined_data$Type)
mylogit <- glm(Type ~ ADP * `Annual Per Capita Cost - Direct` + ADP * `Annual Per Capita Cost - Indirect`, 
               data = combined_data, family = "binomial")

summary(mylogit)

library(ggplot2)

# Create a new dataset with predicted probabilities
combined_data$prob_private <- predict(mylogit, type = "response")

# Plot: ADP vs Predicted Probability of being Private
ggplot(combined_data, aes(x = ADP, y = prob_private)) +
  geom_point(aes(color = Type), alpha = 0.6) +
  geom_smooth(method = "loess", se = FALSE, color = "black") +
  labs(
    title = "Model-Predicted Probability of Being a Private Prison by ADP",
    x = "Average Daily Population (ADP)",
    y = "Predicted Probability (Private)"
  ) +
  theme_minimal()
"""


