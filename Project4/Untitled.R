#install.packages(c("tidyverse", "glmnet", "broom", "rsample", "mvtnorm")) # Ensure mvtnorm is installed
library(tidyverse)
library(glmnet)
library(broom)
library(rsample)
library(mvtnorm) # Make sure mvtnorm is loaded

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
  label = c("No Corr", "Mild Corr", "High Corr", "Almost Perfect corr"),
  rho = c(0.10, 0.50, 0.95, 0.999999)
)

models <- c("Linear", "Ridge", "Lasso")

# Modified simulate_one function to take train and test directly
simulate_one <- function(train_data, test_data, model_name) {
  # For glmnet, you need the x_train/x_test matrices and y_train/y_test vectors
  # For lm, you can use the data frame directly.
  # We select all 'x' columns dynamically.
  x_cols <- paste0("x", 1:15)
  
  x_train <- as.matrix(select(train_data, all_of(x_cols)))
  x_test <- as.matrix(select(test_data, all_of(x_cols)))
  y_train <- train_data$y
  y_test <- test_data$y
  
  fit <- switch(model_name,
                "Linear" = lm(y ~ ., data = train_data), # Use '.' for all predictors in 'train_data'
                "Ridge" = glmnet(x_train, y_train, alpha = 0, lambda = 0.1),
                "Lasso" = glmnet(x_train, y_train, alpha = 1, lambda = 0.1)
  )
  
  preds <- if (model_name == "Linear") {
    predict(fit, newdata = test_data)
  } else {
    predict(fit, newx = x_test, s = ifelse(model_name == "Ridge", 1, 0.1))
  }
  
  mse <- mean((y_test - preds)^2)
  tibble(Model = model_name, MSE = mse)
}


# Run models on each dataset
results <- correlations %>%
  mutate(simulations = map(rho, ~ replicate(100, generate_data(correlation = .x), simplify = FALSE))) %>%
  unnest(simulations) %>%
  # Now, for each 'simulations' (which is a full df), create a split
  mutate(data_split = map(simulations, ~ initial_split(.x, prop = 0.7))) %>%
  mutate(train_df = map(data_split, training),
         test_df = map(data_split, testing)) %>%
  # Pass train_df and test_df to simulate_one
  mutate(results = pmap(list(train_df, test_df), function(tr, te) {
    map_dfr(models, ~ simulate_one(train_data = tr, test_data = te, model_name = .x))
  })) %>%
  unnest(results)


summary <- results %>%
  group_by(Model, label) %>%
  summarise(
    Mean_MSE = mean(MSE),
    SD_MSE = sd(MSE),
    .groups = 'drop'
  )

print(summary) # Use print to display tibbles

ggplot(results, aes(x = Model, y = MSE, fill = label)) +
  geom_boxplot() +
  labs(title = "Model MSE by Predictor Correlation (All Xs)", x = "Correlation", y = "MSE") +
  theme_minimal()

ggplot(results, aes(x = label, y = MSE, fill = Model)) +
  geom_boxplot() +
  labs(title = "Model MSE by Predictor Correlation (All Xs)", x = "Correlation", y = "MSE") +
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
pairwise.wilcox.test(results$MSE, results$Model, p.adjust.method = "holm")



