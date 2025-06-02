

# PCA 

# Load necessary libraries
library(tidyverse)

# State Data
state_data <- read_csv("./Project1/data/Processed_Data/State_Prison_Revenue.csv")
numeric_state_data <- state_data %>% select(where(is.numeric))
scaled_data <- scale(numeric_state_data)
pca_result_pub <- prcomp(scaled_data, center = TRUE, scale. = TRUE)

# Private Data
priv_data <- read_csv("./Project1/data/Processed_Data/Private_Prison_Revenue.csv")
numeric_state_data <- priv_data %>% select(where(is.numeric))
scaled_data <- scale(numeric_state_data)
pca_result_priv <- prcomp(scaled_data, center = TRUE, scale. = TRUE)

# Step 6: View summary and proportion of variance
summary(pca_result)

# Step 7: Scree plot (variance explained)
plot(pca_result, type = "l", main = "Scree Plot for State Data")

# Step 8: Biplot to visualize PCs
biplot(pca_result, scale = 0)

# Optional: Extract PCA scores
pca_scores <- as.data.frame(pca_result$x)


library(ggplot2)

# --- State Data ---
state_data <- read_csv("./Project1/data/Processed_Data/State_Prison_Revenue.csv")
numeric_state <- state_data %>% select(where(is.numeric))
scaled_state <- scale(state_data %>% select(tail(names(.), 4)))
pca_state <- prcomp(scaled_state, center = TRUE, scale. = TRUE)
state_scores <- as.data.frame(pca_state$x)
state_scores$Type <- "State"

# --- Private Data ---
priv_data <- read_csv("./Project1/data/Processed_Data/Private_Prison_Revenue.csv")
numeric_priv <- priv_data %>% select(where(is.numeric))
scaled_priv <- scale(numeric_priv %>% select(tail(names(.), 4)))
pca_priv <- prcomp(scaled_priv, center = TRUE, scale. = TRUE)
priv_scores <- as.data.frame(pca_priv$x)
priv_scores$Type <- "Private"

# Step 7: Scree plot (variance explained)
plot(pca_state, type = "l", main = "Scree Plot for State Data")
plot(pca_priv, type = "l", main = "Scree Plot for Private Data")

print(pca_state)
print(pca_priv)

# --- Combine and Plot ---
combined_scores <- rbind(
  state_scores[, c("PC1", "PC2", "Type")],
  priv_scores[, c("PC1", "PC2", "Type")]
)

ggplot(combined_scores, aes(x = PC1, y = PC2, color = Type)) +
  geom_point(size = 3, alpha = 0.7) +
  labs(title = "PCA of State vs Private Prisons",
       x = "Principal Component 1",
       y = "Principal Component 2") +
  theme_minimal()


# Print out what is in each component
# Print loadings for PC1 and PC2 - State
cat("Top contributing features to PC1 (State):\n")
print(sort(abs(pca_state$rotation[,1]), decreasing = TRUE))

cat("\nTop contributing features to PC2 (State):\n")
print(sort(abs(pca_state$rotation[,2]), decreasing = TRUE))

# Print loadings for PC1 and PC2 - Private
cat("\nTop contributing features to PC1 (Private):\n")
print(sort(abs(pca_priv$rotation[,1]), decreasing = TRUE))

cat("\nTop contributing features to PC2 (Private):\n")
print(sort(abs(pca_priv$rotation[,2]), decreasing = TRUE))


