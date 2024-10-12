WeatherDataLoader <- setRefClass(
  "WeatherDataLoader",
  fields = list(
    file_path = "character",
    data = "data.frame"
  ),
  methods = list(
    load_data = function() {
      data <<- read.csv(file_path)
      data <<- data %>%
        mutate(time = ymd_hms(time)) %>%
        rename(
          temperature = temp,
          precipitation = prcp,
          wind_speed = wspd,
          humidity = rhum
        )
      print("Daten erfolgreich geladen und umbenannt.")
    }
  )
)