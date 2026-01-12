# Set working directory
setwd("C:/Users/IT-29/Downloads")

# Load required library
if(!require(corrplot)){
  install.packages("corrplot")
  library(corrplot)
}

# Read the dataset
sales_data <- read.csv("sales_data.csv")

# Select only numeric columns
numeric_data <- sales_data[sapply(sales_data, is.numeric)]

# Generate correlation matrix
cor_matrix <- cor(numeric_data, use = "complete.obs")

# Print correlation matrix
print(cor_matrix)

# Plot correlation matrix (simple & clean)
corrplot(
  cor_matrix,
  method = "number",    # show correlation values
  type = "upper",       # upper triangle only
  tl.col = "black",     # variable name color
  tl.cex = 0.8,         # text size
  number.cex = 0.7      # value size
)

