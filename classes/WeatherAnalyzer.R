WeatherAnalyzer <- setRefClass(
  "WeatherAnalyzer",
  fields = list(
    data = "data.frame"
  ),
  methods = list(
    summary_stats = function() {
      summary(data)
    },
    correlation_analysis = function() {
      cor(data[, sapply(data, is.numeric)], use = "complete.obs")
    }
  )
)