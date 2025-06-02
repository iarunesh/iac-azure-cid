output "web_app_url" {
  description = "The default URL of the deployed Web App"
  value       = "https://${azurerm_linux_web_app.app.default_hostname}"
}

output "app_insights_key" {
  description = "Instrumentation key for Application Insights"
  value       = azurerm_application_insights.app_insights.instrumentation_key
}

output "app_insights_connection_string" {
  description = "Connection string for Application Insights"
  value       = azurerm_application_insights.app_insights.connection_string
}
