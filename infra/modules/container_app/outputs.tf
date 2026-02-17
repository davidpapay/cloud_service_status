output "container_app_url" {
  description = "Public HTTPS URL of the Container App"
  value       = "https://${azurerm_container_app.this.latest_revision_fqdn}"
}

output "container_app_environment_id" {
  description = "ID of the Container App Environment"
  value       = azurerm_container_app_environment.this.id
}

output "container_app_name" {
  description = "Azure Container App name"
  value       = azurerm_container_app.this.name
}