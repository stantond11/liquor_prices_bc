
app_config <- config::get(file = "shiny_app/config.yml")

rsconnect::deployApp(
  appDir = "shiny_app",
  appName = app_config$app_name
)
