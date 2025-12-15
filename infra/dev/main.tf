# Main Terraform configuration file

# Azure resource group
resource "azurerm_resource_group" "cloud_service_status_rg" {
  name     = "rg-cloud-service-status-dev"
  location = "westeurope"
}

# Azure Container Registry
resource "azurerm_container_registry" "cloud_service_status_acr" {
  name                = "acrcloudservicestatusdev"
  resource_group_name = azurerm_resource_group.cloud_service_status_rg.name
  location            = azurerm_resource_group.cloud_service_status_rg.location
  sku                 = "Basic"

  admin_enabled       = true
}
