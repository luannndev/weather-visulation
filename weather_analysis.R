
library(ggplot2)
library(dplyr)

data <- read.csv("weather.csv")

print(head(data))

data <- data %>%
  rename(
    temperature = temp,
    precipitation = prcp
  )

print(head(data))

ggplot(data, aes(x = temperature, y = precipitation)) +
  geom_point(color = "blue", size = 2) +
  labs(title = "Temperatur vs. Niederschlag in Köln", x = "Temperatur (°C)", y = "Niederschlag (mm)") +
  theme_minimal()

# Diagramm speichern
ggsave("weather-cologne.png")