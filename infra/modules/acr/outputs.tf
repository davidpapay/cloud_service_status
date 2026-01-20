# Azure Container Registry module outputs

output "login_server" {
  value = azurerm_container_registry.this.login_server
}

output "username" {
  value     = azurerm_container_registry.this.admin_username
  sensitive = true
}

output "password" {
  value     = azurerm_container_registry.this.admin_password
  sensitive = true
}
