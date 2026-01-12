library(ggplot2)

# Load the dataset, adjust path if needed
iris_data <- read.csv("C:/Users/IT-29/Downloads/iris.csv")

# Histogram of Sepal Length
print(
  ggplot(iris_data, aes(x = sepal_length)) +   # Correct column name
    geom_histogram(binwidth = 0.3, fill = "skyblue", color = "black") +
    labs(title = "Histogram of Sepal Length", x = "Sepal Length", y = "Frequency") +
    theme_minimal()
)

# Box Plot of Sepal Length by Species
print(
  ggplot(iris_data, aes(x = species, y = sepal_length, fill = species)) +  # Correct column name
    geom_boxplot(alpha = 0.7) +
    labs(title = "Box Plot of Sepal Length by Species", x = "Species", y = "Sepal Length") +
    theme_minimal() +
    theme(legend.position = "none")
)




