
install.packages(c("tidyverse", "glmnet", "broom"))
library(tidyverse)
library(glmnet)
library(broom)
set.seed(111)

generate_data <- function(n = 100, correlation = 0.0) {
  # Create a 15x15 covariance matrix with desired correlation
  cov_matrix <- matrix(correlation, nrow = 15, ncol = 15)
  diag(cov_matrix) <- 1  # Set variances to 1
  
  # Generate multivariate normal data
  predictors <- mvtnorm::rmvnorm(n, mean = rep(0, 15), sigma = cov_matrix, method = "eigen")
  
  # Assign each column to x1, x2, ..., x15
  x_list <- as.data.frame(predictors)
  colnames(x_list) <- paste0("x", 1:15)
  
  # Generate y with coefficients 0*x1 + 1*x2 + 2*x3 + 3*x4 + 4*x5 + noise
  noise <- rnorm(n)
  y <- 0 * x_list$x1 + 1 * x_list$x2 + 2 * x_list$x3 + 3 * x_list$x4 + 4 * x_list$x5 + noise
  
  # Combine into a tibble and return
  return(tibble::tibble(x_list, y = y))
}

correlations <- tibble(
  label = c("No Corr", "Mild Corr", "High Corr"),
  rho = c(0.0, 0.5, 0.99)
)

models <- c("Linear", "Ridge", "Lasso")

simulate_one <- function(df, model_name) {
  train <- training(split)
  test <- testing(split)
  x_train <- as.matrix(select(train, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15))
  x_test <- as.matrix(select(test, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15))
  y_train <- train$y
  y_test <- test$y
  
  fit <- switch(model_name,
                "Linear" = lm(y ~ x1 + x2 + x3 + x4 + x5 + x6 + x7 + x8 + x9 + x10 + x11 + x12 + x13 + x14 + x15, data = train),
                "Ridge" = glmnet(x_train, y_train, alpha = 0, lambda = 0.1),
                "Lasso" = glmnet(x_train, y_train, alpha = 1, lambda = 0.1)
  )
  
  preds <- if (model_name == "Linear") {
    predict(fit, newdata = test)
  } else {
    predict(fit, newx = x_test, s = ifelse(model_name == "Ridge", 1, 0.1))
  }
  
  mse <- mean((y_test - preds)^2)
  tibble(Model = model_name, MSE = mse)
}

library(rsample)

# Run models on each dataset
results <- correlations %>%
  mutate(simulations = map(rho, ~ replicate(10, generate_data(correlation = .x), simplify = FALSE))) %>%
  unnest(simulations) %>%
  mutate(results = map(simulations, ~ map_dfr(models, function(model) simulate_one(., model)))) %>%
  unnest(results)


summary <- results %>%
  group_by(Model, label) %>%
  summarise(
    Mean_MSE = mean(MSE),
    SD_MSE = sd(MSE),
    .groups = 'drop'
  )

summary

ggplot(results, aes(x = label, y = MSE, fill = Model)) +
  geom_boxplot() +
  labs(title = "Model MSE by Predictor Correlation", x = "Correlation", y = "MSE") +
  theme_minimal()

#| fig-height: 7.5
#| fig-width: 15

alpha <- 0.05

# Fit the ANOVA model
model <- aov(MSE ~ label + Model, data = results)

plot(model)

hist(model$residuals)

# Perform Tukey's HSD for multiple comparisons with alpha 
tukey_results <- TukeyHSD(model, conf.level = 1 - alpha) 

# View the results
plot(tukey_results)


# Kruskal-Wallis for 'label'
kruskal.test(MSE ~ label, data = results)

# Kruskal-Wallis for 'Model'
kruskal.test(MSE ~ Model, data = results)

# OR install https://github.com/cran/ARTool

# Pairwise comparisons for 'label'
pairwise.wilcox.test(results$MSE, results$label, p.adjust.method = "holm")

