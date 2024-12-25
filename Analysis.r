# Load necessary libraries
library(plotly)

# Load the dataset
stroke_data <- read.csv("E:\\Client Work\\Qasim Client\\Qasim hertfordshire\\R Analysis\\healthcare-dataset-stroke-data.csv")

# Create a static boxplot first
p <- ggplot(stroke_data, aes(x = factor(stroke), y = avg_glucose_level, fill = factor(stroke))) + 
  geom_boxplot() +
  scale_fill_manual(values = c("lightblue", "pink")) +
  labs(title = "Glucose Levels by Stroke Occurrence",
       x = "Stroke (0 = No, 1 = Yes)",
       y = "Average Glucose Levels (mg/dL)") +
  theme_minimal() +
  scale_x_discrete(labels = c("No Stroke", "Stroke")) 

# Convert the ggplot to an interactive plot using plotly
interactive_plot <- ggplotly(p)

# Show the interactive plot
interactive_plot

# Chi-square test for hypertension and stroke
table_hyp <- table(stroke_data$hypertension, stroke_data$stroke)
chisq.test(table_hyp)

# T-test for glucose levels
t.test(avg_glucose_level ~ stroke, data = stroke_data)
