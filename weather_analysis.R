
chooseCRANmirror(graphics = FALSE, ind = 1)

necessary_packages <- c("evaluate", "ggplot2", "dplyr", "lubridate", "plotly", "htmlwidgets")
new_packages <- necessary_packages[!(necessary_packages %in% installed.packages()[,"Package"])]
if(length(new_packages)) install.packages(new_packages)

library(ggplot2)
library(dplyr)
library(lubridate)
library(plotly)
library(htmlwidgets)

if (!dir.exists("output")) {
  dir.create("output")
}

source("classes/WeatherDataLoader.R")
source("classes/WeatherAnalyzer.R")
source("classes/WeatherVisualizer.R")
source("classes/WeatherReport.R")

data_loader <- WeatherDataLoader$new(file_path = "data/weather.csv")
analyzer <- WeatherAnalyzer$new()
visualizer <- WeatherVisualizer$new()
report <- WeatherReport$new(data_loader = data_loader, analyzer = analyzer, visualizer = visualizer)

report$generate_report()