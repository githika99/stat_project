library(tidyverse)
library(broom)
library(ggplot2)
library(ggpubr)
library(ggfortify)

# Load datasets
private_data <- read_csv("./Project1/data/Processed_Data/Private_Prison_Revenue.csv")
state_data <- read_csv("./Project1/data/Processed_Data/State_Prison_Revenue.csv")

# Filter for minimum and medium custody only
private_data <- private_data %>% filter(str_detect(`Prison Unit`, "Min|Med"))
state_data <- state_data %>% filter(str_detect(`Prison Unit`, "Min|Med"))


s1 <- lm(`Annual Per Capita Cost - Direct` ~ ADP, data = state_data)
s2 <- lm(`Annual Per Capita Cost - Indirect` ~ ADP, data = state_data)
s3 <- lm(`Annual Per Capita Cost - Total` ~ ADP, data = state_data)
summary(s1)
summary(s2)
summary(s3)


p1 <- lm(`Annual Per Capita Cost - Direct` ~ ADP, data = private_data)
p2 <- lm(`Annual Per Capita Cost - Indirect` ~ ADP, data = private_data)
p3 <- lm(`Annual Per Capita Cost - Total` ~ ADP, data = private_data)
summary(p1)
summary(p2)
summary(p3)

plot_regression <- function(data, model, yvar, title) {
  ggplot(data, aes(x = ADP, y = !!sym(yvar))) +
    geom_point(alpha = 0.7) +
    geom_smooth(method = "lm", se = TRUE, color = "blue") +
    labs(title = title, x = "Average Daily Population (ADP)", y = yvar) +
    theme_minimal()
}

# Generate plots
p_direct <- plot_regression(private_data, p1, "Annual Per Capita Cost - Direct", "Private: Direct Cost vs ADP")
s_direct <- plot_regression(state_data, s1, "Annual Per Capita Cost - Direct", "State: Direct Cost vs ADP")
p_total <- plot_regression(private_data, p3, "Annual Per Capita Cost - Total", "Private: Total Cost vs ADP")
s_total <- plot_regression(state_data, s3, "Annual Per Capita Cost - Total", "State: Total Cost vs ADP")

# Display
ggarrange(p_direct, s_direct, p_total, s_total, ncol = 2, nrow = 2)

# Diagnostic plots for State and Private models
autoplot(p1, label.size = 3) + ggtitle("Private: Direct Cost Diagnostics")
autoplot(s1, label.size = 3) + ggtitle("State: Direct Cost Diagnostics")

bind_rows(
  tidy(p1) %>% mutate(model = "Private Direct"),
  tidy(s1) %>% mutate(model = "State Direct"),
  tidy(p3) %>% mutate(model = "Private Total"),
  tidy(s3) %>% mutate(model = "State Total")
) %>%
  select(model, term, estimate, std.error, p.value) %>%
  knitr::kable(digits = 3)
