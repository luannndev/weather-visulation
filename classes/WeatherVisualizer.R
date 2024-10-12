WeatherVisualizer <- setRefClass(
  "WeatherVisualizer",
  fields = list(
    data = "data.frame"
  ),
  methods = list(
    plot_temp_vs_precip = function() {
      plot <- tryCatch({
        ggplot(data, aes(x = temperature, y = precipitation)) +
          geom_point(color = "blue", size = 3, alpha = 0.7) +
          geom_smooth(method = "lm", col = "red", se = FALSE) +
          labs(
            title = "Temperatur vs. Niederschlag in Köln",
            subtitle = "Datenquelle: weather.csv",
            x = "Temperatur (°C)",
            y = "Niederschlag (mm)"
          ) +
          theme_minimal(base_size = 15) +
          theme(
            plot.title = element_text(hjust = 0.5),
            plot.subtitle = element_text(hjust = 0.5)
          )
      }, error = function(e) {
        message('Fehler bei plot_temp_vs_precip: ', e)
        NULL
      })
      ggplotly(plot)
    },
    plot_temp_over_time = function() {
      plot <- tryCatch({
        ggplot(data, aes(x = time, y = temperature)) +
          geom_line(color = "orange", linewidth = 1) +
          labs(
            title = "Temperaturverlauf in Köln",
            subtitle = "Datenquelle: weather.csv",
            x = "Zeit",
            y = "Temperatur (°C)"
          ) +
          theme_minimal(base_size = 15) +
          theme(
            plot.title = element_text(hjust = 0.5),
            plot.subtitle = element_text(hjust = 0.5)
          )
      }, error = function(e) {
        message('Fehler bei plot_temp_over_time: ', e)
        NULL
      })
      ggplotly(plot)
    },
    plot_humidity_over_time = function() {
      plot <- tryCatch({
        ggplot(data, aes(x = time, y = humidity)) +
          geom_line(color = "blue", linewidth = 1) +
          labs(
            title = "Luftfeuchtigkeitsverlauf in Köln",
            subtitle = "Datenquelle: weather.csv",
            x = "Zeit",
            y = "Luftfeuchtigkeit (%)"
          ) +
          theme_minimal(base_size = 15) +
          theme(
            plot.title = element_text(hjust = 0.5),
            plot.subtitle = element_text(hjust = 0.5)
          )
      }, error = function(e) {
        message('Fehler bei plot_humidity_over_time: ', e)
        NULL
      })
      ggplotly(plot)
    },
    plot_wind_speed_over_time = function() {
      plot <- tryCatch({
        ggplot(data, aes(x = time, y = wind_speed)) +
          geom_line(color = "green", linewidth = 1) +
          labs(
            title = "Windgeschwindigkeitsverlauf in Köln",
            subtitle = "Datenquelle: weather.csv",
            x = "Zeit",
            y = "Windgeschwindigkeit (km/h)"
          ) +
          theme_minimal(base_size = 15) +
          theme(
            plot.title = element_text(hjust = 0.5),
            plot.subtitle = element_text(hjust = 0.5)
          )
      }, error = function(e) {
        message('Fehler bei plot_wind_speed_over_time: ', e)
        NULL
      })
      ggplotly(plot)
    }
  )
)