# Load libraries
if(!require(ggplot2)){
  install.packages("ggplot2")
  library(ggplot2)
}

if(!require(dplyr)){
  install.packages("dplyr")
  library(dplyr)
}

# Read dataset
cust_data <- read.csv("C:/Users/IT-29/Downloads/Customer Satisfaction Scores and Behavior Data.csv")

# Show column names
print(colnames(cust_data))

# ==============================
# 1️⃣ Scatter Plot
# Satisfaction Score vs Age
# ==============================
print(
  ggplot(cust_data, aes(x = Age, y = Satisfaction_Score)) +
    geom_point(color = "blue") +
    labs(
      title = "Scatter Plot of Age vs Satisfaction Score",
      x = "Age",
      y = "Satisfaction Score"
    ) +
    theme_minimal()
)

# ==============================
# 2️⃣ Pie Chart
# Satisfaction Score by Group
# ==============================
pie_data <- cust_data %>%
  group_by(Group) %>%
  summarise(Total_Score = sum(Satisfaction_Score, na.rm = TRUE))

print(
  ggplot(pie_data, aes(x = "", y = Total_Score, fill = Group)) +
    geom_bar(stat = "identity", width = 1) +
    coord_polar("y") +
    labs(title = "Pie Chart of Satisfaction Score by Group") +
    theme_void()
)

# ==============================
# 3️⃣ High–Low Chart
# Satisfaction Score range by Group
# ==============================
high_low_data <- cust_data %>%
  group_by(Group) %>%
  summarise(
    Low = min(Satisfaction_Score, na.rm = TRUE),
    High = max(Satisfaction_Score, na.rm = TRUE)
  )

print(
  ggplot(high_low_data, aes(x = Group, ymin = Low, ymax = High)) +
    geom_linerange(color = "darkred", size = 1.2) +
    labs(
      title = "High–Low Chart of Satisfaction Score by Group",
      x = "Group",
      y = "Satisfaction Score Range"
    ) +
    theme_minimal()
)


