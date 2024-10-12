WeatherReport <- setRefClass(
  "WeatherReport",
  fields = list(
    data_loader = "WeatherDataLoader",
    analyzer = "WeatherAnalyzer",
    visualizer = "WeatherVisualizer"
  ),
  methods = list(
    generate_report = function() {
      print("Generiere Datenbericht...")
      data_loader$load_data()
      local_data <- data_loader$data

      analyzer$data <- local_data
      print(analyzer$summary_stats())
      print(analyzer$correlation_analysis())

      visualizer$data <- local_data

      temp_precip_plot <- visualizer$plot_temp_vs_precip()
      if (!is.null(temp_precip_plot)) {
        message("temp_precip_plot erfolgreich erstellt")
      } else {
        message("temp_precip_plot ist NULL")
      }

      temp_time_plot <- visualizer$plot_temp_over_time()
      if (!is.null(temp_time_plot)) {
        message("temp_time_plot erfolgreich erstellt")
      } else {
        message("temp_time_plot ist NULL")
      }

      humidity_time_plot <- visualizer$plot_humidity_over_time()
      if (!is.null(humidity_time_plot)) {
        message("humidity_time_plot erfolgreich erstellt")
      } else {
        message("humidity_time_plot ist NULL")
      }

      wind_speed_time_plot <- visualizer$plot_wind_speed_over_time()
      if (!is.null(wind_speed_time_plot)) {
        message("wind_speed_time_plot erfolgreich erstellt")
      } else {
        message("wind_speed_time_plot ist NULL")
      }

      if (!dir.exists("output")) {
        dir.create("output")
      }

      if (!is.null(temp_precip_plot)) {
        htmlwidgets::saveWidget(temp_precip_plot, "output/temperature_vs_precipitation.html")
        message("temperature_vs_precipitation.html erfolgreich gespeichert.")
      } else {
        message("temp_precip_plot wurde nicht erstellt.")
      }

      if (!is.null(temp_time_plot)) {
        htmlwidgets::saveWidget(temp_time_plot, "output/temperature_time_series.html")
        message("temperature_time_series.html erfolgreich gespeichert.")
      } else {
        message("temp_time_plot wurde nicht erstellt.")
      }

      if (!is.null(humidity_time_plot)) {
        htmlwidgets::saveWidget(humidity_time_plot, "output/humidity_time_series.html")
        message("humidity_time_series.html erfolgreich gespeichert.")
      } else {
        message("humidity_time_plot wurde nicht erstellt.")
      }

      if (!is.null(wind_speed_time_plot)) {
        htmlwidgets::saveWidget(wind_speed_time_plot, "output/wind_speed_time_series.html")
        message("wind_speed_time_series.html erfolgreich gespeichert.")
      } else {
        message("wind_speed_time_plot wurde nicht erstellt.")
      }

      print("Bericht erfolgreich erstellt und Visualisierungen als HTML-Dateien gespeichert.")
    }
  )
)